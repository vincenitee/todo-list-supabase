import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list_supabase/models/task.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
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
  final List<Task> tasks = [
    Task(
      id: 1,
      userId: 'f4b36c94-2a1f-11ee-be56-0242ac120002',
      title: 'Buy groceries',
      isDone: false,
      createdAt: DateTime.now().subtract(Duration(hours: 5)),
    ),
    Task(
      id: 2,
      userId: 'f4b36c94-2a1f-11ee-be56-0242ac120002',
      title: 'Study Flutter',
      isDone: true,
      createdAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    Task(
      id: 3,
      userId: 'f4b36c94-2a1f-11ee-be56-0242ac120002',
      title: 'Workout',
      isDone: false,
      createdAt: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Task(
      id: 4,
      userId: 'f4b36c94-2a1f-11ee-be56-0242ac120002',
      title: 'Read a book',
      isDone: true,
      createdAt: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  void _handleTaskSubmission(String taskTitle) {
    tasks.add(
      Task(
        id: 6,
        userId: 'f4b36c94-2a1f-11ee-be56-0242ac120002',
        title: taskTitle,
        isDone: false,
        createdAt: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authNotifierProvider, (previous, next) {
      next.whenData((user) {
        if (user != null && previous?.value == null) {
          Fluttertoast.showToast(msg: 'Login successful');
        }
      });
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
            child: ProgressCard(tasks: tasks),
          ),

          // Task List Header (Optional)
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TaskListHeader(tasksCount: tasks.length),
          ),

          // List of Tasks
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TaskList(
                tasks: tasks,
                onTaskTap: (task) {
                  setState(() {
                    task.isDone = !task.isDone;
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
