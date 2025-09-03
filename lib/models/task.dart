class Task{
  final int id;
  final String userId;
  final String title;
  final bool isDone;
  final DateTime createdAt;

  Task({
    required this.id,
    required this.userId,
    required this.title,
    required this.isDone,
    required this.createdAt,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int,
      userId: map['user_id'] as String,
      title: map['title'] as String,
      isDone: map['done'] as bool,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'done': isDone,
      'created_at': createdAt.toIso8601String(),
    };
  }
}