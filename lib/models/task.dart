import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  @JsonSerializable(explicitToJson: true)
  const factory Task({
    @JsonKey(includeIfNull: false) final int? id,
    @JsonKey(name: 'user_id') required String userId,
    required String title,
    @JsonKey(name: 'done') required bool isDone,
    @JsonKey(name: 'created_at', includeIfNull: false) DateTime? createdAt,
  }) = _Task;

  // Convert from JSON to Task
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
