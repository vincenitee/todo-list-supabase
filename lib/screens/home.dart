import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
import 'package:todo_list_supabase/providers/task_provider.dart';
import 'package:todo_list_supabase/screens/login.dart';
import 'package:todo_list_supabase/screens/profile.dart';
import 'package:todo_list_supabase/widgets/custom_progress_card.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';
import 'package:todo_list_supabase/widgets/task_dialog.dart';
import 'package:todo_list_supabase/widgets/task_list.dart';
import 'package:todo_list_supabase/widgets/task_list_header.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _handleTaskSubmission(String taskTitle) {}
  @override
  void initState() {
    super.initState();
    Fluttertoast.showToast(
      msg: 'Login successfull',
      gravity: ToastGravity.BOTTOM_RIGHT,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(taskNotifierProvider);
    final authState = ref.watch(authNotifierProvider);

    Logger().d('Auth State in HomeScreen: $authState');
    ref.listen(authNotifierProvider, (previous, next) {
      next.when(
        data: (state) {
          if (state.event != AuthChangeEvent.signedIn) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
            );
          }
        },
        error: (_, _) => {},
        loading: () {},
      );
    });

    return Scaffold(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              );
            },
            icon: Icon(Icons.person, color: Colors.white, size: 20),
          ),
        ],
      ),

      body: Column(
        children: [
          // Search Field
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: CustomTextField(label: 'Search task'),
            ),
          ),

          // Progress Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white, // Solid background moved to decoration
            ),
            child: ProgressCard(tasks: tasks.value ?? []),
          ),

          // Task List Header (Optional)
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TaskListHeader(tasksCount: 0),
          ),

          // List of Tasks
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TaskList(
                tasks: tasks.value ?? [],
                onTaskTap: (task) {
                  setState(() {
                    // TODO: IMPLEMENT THE TOGGLING OF TASK STATUS
                    // task.isDone = !task.isDone;
                  });
                },
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => TaskDialog(
              // TODO: Implement the actual saving of data to the database
              onSubmit: _handleTaskSubmission,
            ),
          );
        },

        backgroundColor: Colors.blue.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add_task, color: Colors.white, size: 24),
      ),
    );
  }
}
