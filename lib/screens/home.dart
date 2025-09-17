import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/models/task.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
import 'package:todo_list_supabase/providers/task_provider.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/custom_progress_card.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';
import 'package:todo_list_supabase/widgets/task_list.dart';
import 'package:todo_list_supabase/widgets/task_list_header.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

// TODO: REFACTOR THIS SHIT LATER
class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _taskTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Fluttertoast.showToast(
      msg: 'Login successfull',
      gravity: ToastGravity.BOTTOM_RIGHT,
    );

    ref.listen(authNotifierProvider, (previous, next) {
      next.whenData((state) {
        if (state.event != AuthChangeEvent.signedIn) {
          // Navigates to login screen
          context.go('/');
        }
      });
    });
  }

  @override
  void dispose() {
    _taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskState = ref.watch(taskNotifierProvider);
    final taskNotifier = ref.read(taskNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);

    Logger().d('Tasks in HomeScreen: $taskState');
    Logger().d(
      'Auth State in HomeScreen: ${authState.value?.session?.user.id}',
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        automaticallyImplyLeading: false,
        title: Text(
          'Tasks',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.go('/profiles');
            },
            icon: Icon(Icons.person, color: Colors.white, size: 20),
          ),
        ],
      ),

      body: taskState.when(
        data: (tasks) {
          return Column(
            children: [
              const SizedBox(height: 20),
              // Progress Section
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: ProgressCard(tasks: tasks ?? []),
              ),

              // Task List Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TaskListHeader(tasksCount: tasks?.length ?? 0),
              ),

              // List of Tasks
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TaskList(
                    tasks: tasks ?? [],
                    onTaskTap: (task) {
                      taskNotifier.toggleTask(task);
                      Fluttertoast.showToast(
                        msg: task.isDone
                            ? 'Marked as pending'
                            : 'Marked as completed',
                        gravity: ToastGravity.BOTTOM_RIGHT,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
        error: (e, _) {
          return Center(child: Text('Error loading tasks: $e'));
        },
        loading: () {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                Text('Fetching tasks...'),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return AnimatedPadding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(
                    context,
                  ).viewInsets.bottom, // ✅ Keyboard height
                ),
                duration: const Duration(milliseconds: 100),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Add New Task',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: 'Title',
                          hintText: 'I want to...',
                          controller: _taskTitleController,
                          enabled: taskState.isLoading ? false : true,
                          onSubmitted: (value) {
                            if (value.trim().isEmpty) {
                              Fluttertoast.showToast(
                                msg: 'Task title cannot be empty',
                                gravity: ToastGravity.BOTTOM_RIGHT,
                              );
                              return;
                            }

                            // Checks if there was an authenticated user
                            final user = authState.value?.session?.user;

                            if (user == null) {
                              Fluttertoast.showToast(
                                msg: 'No authenticated user found',
                                gravity: ToastGravity.BOTTOM_RIGHT,
                              );
                              return;
                            }

                            final userId = user.id;

                            // Adds the task
                            taskNotifier.addTask(
                                  Task(
                                    userId: userId,
                                    title: value.trim(),
                                    isDone: false,
                                  ),
                                );

                            Fluttertoast.showToast(
                              msg: 'Task added successfully',
                              gravity: ToastGravity.BOTTOM_RIGHT,
                            );

                            // Clears the text field
                            _taskTitleController.clear();
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },

        backgroundColor: Colors.blue.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add_task, color: Colors.white, size: 24),
      ),
    );
  }
}
