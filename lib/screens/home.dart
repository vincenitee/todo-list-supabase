import 'package:flutter/material.dart';
import 'package:todo_list_supabase/models/task.dart';
import 'package:todo_list_supabase/widgets/custom_progress_card.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';
import 'package:todo_list_supabase/widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                if (tasks.isNotEmpty)
                  Text(
                    '${tasks.length} ${tasks.length == 1 ? 'task' : 'tasks'}',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
              ],
            ),
          ),

          // List of Tasks
          TaskList(tasks: tasks, onTaskTap: (task) {
            setState(() {
              task.isDone = !task.isDone;
            });
          })
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add_task, color: Colors.white, size: 24),
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          final List<Widget> screens = [HomeScreen(), HomeScreen()];
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => screens[index]),
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
