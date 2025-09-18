// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskStatsHash() => r'1f6a3800a24d579118db9d66a4465782bc3a933d';

/// See also [taskStats].
@ProviderFor(taskStats)
final taskStatsProvider = AutoDisposeProvider<TaskStats>.internal(
  taskStats,
  name: r'taskStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskStatsRef = AutoDisposeProviderRef<TaskStats>;
String _$taskNotifierHash() => r'3b6a4507044a4e534aa6c05b56d649d4ed51b30e';

/// See also [TaskNotifier].
@ProviderFor(TaskNotifier)
final taskNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TaskNotifier, List<Task>>.internal(
      TaskNotifier.new,
      name: r'taskNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taskNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TaskNotifier = AutoDisposeAsyncNotifier<List<Task>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
