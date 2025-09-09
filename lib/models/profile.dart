class Profile {
  final int id;
  final String userId;
  final String username;
  final DateTime createdAt;

  Profile({
    required this.id,
    required this.userId,
    required this.username,
    required this.createdAt,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as int,
      userId: map['user_id'] as String,
      username: map['username'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }
}