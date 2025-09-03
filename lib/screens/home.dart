import 'package:flutter/material.dart';
import 'package:todo_list_supabase/models/task.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.task_outlined, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              'TO-DO Tasks',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                letterSpacing: 1.2,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: CustomTextField(label: 'Search task'),
          ),

          // List of Tasks
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  leading: Icon(
                    task.isDone
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: task.isDone ? Colors.blue.shade700 : Colors.grey,
                  ),
                  title: Text(task.title),
                  trailing: Text(
                    '${task.createdAt.hour}:${task.createdAt.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  subtitle: Text(task.isDone ? 'Completed' : 'Pending'),
                  onTap: () {
                    // toggle done state in UI for demo purposes
                    task.isDone = !task.isDone;
                    (context as Element)
                        .markNeedsBuild(); // rebuild to reflect change
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add_task, color: Colors.white, size: 24),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
