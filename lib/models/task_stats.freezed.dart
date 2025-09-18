// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskStats {

 int get total; int get completed; int get pending; int get completionRate;
/// Create a copy of TaskStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskStatsCopyWith<TaskStats> get copyWith => _$TaskStatsCopyWithImpl<TaskStats>(this as TaskStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskStats&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate));
}


@override
int get hashCode => Object.hash(runtimeType,total,completed,pending,completionRate);

@override
String toString() {
  return 'TaskStats(total: $total, completed: $completed, pending: $pending, completionRate: $completionRate)';
}


}

/// @nodoc
abstract mixin class $TaskStatsCopyWith<$Res>  {
  factory $TaskStatsCopyWith(TaskStats value, $Res Function(TaskStats) _then) = _$TaskStatsCopyWithImpl;
@useResult
$Res call({
 int total, int completed, int pending, int completionRate
});




}
/// @nodoc
class _$TaskStatsCopyWithImpl<$Res>
    implements $TaskStatsCopyWith<$Res> {
  _$TaskStatsCopyWithImpl(this._self, this._then);

  final TaskStats _self;
  final $Res Function(TaskStats) _then;

/// Create a copy of TaskStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? completed = null,Object? pending = null,Object? completionRate = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskStats].
extension TaskStatsPatterns on TaskStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskStats value)  $default,){
final _that = this;
switch (_that) {
case _TaskStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskStats value)?  $default,){
final _that = this;
switch (_that) {
case _TaskStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int completed,  int pending,  int completionRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskStats() when $default != null:
return $default(_that.total,_that.completed,_that.pending,_that.completionRate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int completed,  int pending,  int completionRate)  $default,) {final _that = this;
switch (_that) {
case _TaskStats():
return $default(_that.total,_that.completed,_that.pending,_that.completionRate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int completed,  int pending,  int completionRate)?  $default,) {final _that = this;
switch (_that) {
case _TaskStats() when $default != null:
return $default(_that.total,_that.completed,_that.pending,_that.completionRate);case _:
  return null;

}
}

}

/// @nodoc


class _TaskStats implements TaskStats {
  const _TaskStats({required this.total, required this.completed, required this.pending, required this.completionRate});
  

@override final  int total;
@override final  int completed;
@override final  int pending;
@override final  int completionRate;

/// Create a copy of TaskStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskStatsCopyWith<_TaskStats> get copyWith => __$TaskStatsCopyWithImpl<_TaskStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskStats&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate));
}


@override
int get hashCode => Object.hash(runtimeType,total,completed,pending,completionRate);

@override
String toString() {
  return 'TaskStats(total: $total, completed: $completed, pending: $pending, completionRate: $completionRate)';
}


}

/// @nodoc
abstract mixin class _$TaskStatsCopyWith<$Res> implements $TaskStatsCopyWith<$Res> {
  factory _$TaskStatsCopyWith(_TaskStats value, $Res Function(_TaskStats) _then) = __$TaskStatsCopyWithImpl;
@override @useResult
$Res call({
 int total, int completed, int pending, int completionRate
});




}
/// @nodoc
class __$TaskStatsCopyWithImpl<$Res>
    implements _$TaskStatsCopyWith<$Res> {
  __$TaskStatsCopyWithImpl(this._self, this._then);

  final _TaskStats _self;
  final $Res Function(_TaskStats) _then;

/// Create a copy of TaskStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? completed = null,Object? pending = null,Object? completionRate = null,}) {
  return _then(_TaskStats(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
