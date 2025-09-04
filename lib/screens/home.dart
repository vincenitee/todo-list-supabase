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
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: () {
                final completedTasks = tasks
                    .where((task) => task.isDone)
                    .length;
                final totalTasks = tasks.length;
                final percentage = totalTasks > 0
                    ? (completedTasks / totalTasks * 100)
                    : 0.0;

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Progress',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '$completedTasks of $totalTasks tasks completed',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${percentage.toInt()}%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: percentage / 100,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          percentage == 100
                              ? Colors.green.shade600
                              : Colors.blue.shade600,
                        ),
                        minHeight: 8,
                      ),
                    ),
                  ],
                );
              }(),
            ),
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
          Expanded(
            child: tasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.task_alt,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No tasks yet',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Add your first task to get started!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: tasks.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5),
                          ),
                          leading: Icon(
                            task.isDone
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: task.isDone
                                ? Colors.blue.shade700
                                : Colors.grey,
                          ),
                          title: Text(task.title),
                          trailing: Text(
                            '${task.createdAt.hour}:${task.createdAt.minute.toString().padLeft(2, '0')}',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          tileColor: task.isDone
                              ? Colors.lightBlue.shade50
                              : Colors.grey.shade50,
                          subtitle: Text(task.isDone ? 'Completed' : 'Pending'),
                          onTap: () {
                            // toggle done state in UI for demo purposes
                            task.isDone = !task.isDone;
                            (context as Element)
                                .markNeedsBuild(); // rebuild to reflect change
                          },
                        ),
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
