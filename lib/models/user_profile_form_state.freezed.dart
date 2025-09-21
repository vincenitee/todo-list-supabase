// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileFormState {

 String get username; String get password; bool get isLoading; String? get successMessage; String? get errorMessage; String? get usernameError; String? get passwordError;
/// Create a copy of UserProfileFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileFormStateCopyWith<UserProfileFormState> get copyWith => _$UserProfileFormStateCopyWithImpl<UserProfileFormState>(this as UserProfileFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileFormState&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.usernameError, usernameError) || other.usernameError == usernameError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError));
}


@override
int get hashCode => Object.hash(runtimeType,username,password,isLoading,successMessage,errorMessage,usernameError,passwordError);

@override
String toString() {
  return 'UserProfileFormState(username: $username, password: $password, isLoading: $isLoading, successMessage: $successMessage, errorMessage: $errorMessage, usernameError: $usernameError, passwordError: $passwordError)';
}


}

/// @nodoc
abstract mixin class $UserProfileFormStateCopyWith<$Res>  {
  factory $UserProfileFormStateCopyWith(UserProfileFormState value, $Res Function(UserProfileFormState) _then) = _$UserProfileFormStateCopyWithImpl;
@useResult
$Res call({
 String username, String password, bool isLoading, String? successMessage, String? errorMessage, String? usernameError, String? passwordError
});




}
/// @nodoc
class _$UserProfileFormStateCopyWithImpl<$Res>
    implements $UserProfileFormStateCopyWith<$Res> {
  _$UserProfileFormStateCopyWithImpl(this._self, this._then);

  final UserProfileFormState _self;
  final $Res Function(UserProfileFormState) _then;

/// Create a copy of UserProfileFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,Object? isLoading = null,Object? successMessage = freezed,Object? errorMessage = freezed,Object? usernameError = freezed,Object? passwordError = freezed,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,usernameError: freezed == usernameError ? _self.usernameError : usernameError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileFormState].
extension UserProfileFormStatePatterns on UserProfileFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileFormState value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileFormState value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String password,  bool isLoading,  String? successMessage,  String? errorMessage,  String? usernameError,  String? passwordError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileFormState() when $default != null:
return $default(_that.username,_that.password,_that.isLoading,_that.successMessage,_that.errorMessage,_that.usernameError,_that.passwordError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String password,  bool isLoading,  String? successMessage,  String? errorMessage,  String? usernameError,  String? passwordError)  $default,) {final _that = this;
switch (_that) {
case _UserProfileFormState():
return $default(_that.username,_that.password,_that.isLoading,_that.successMessage,_that.errorMessage,_that.usernameError,_that.passwordError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String password,  bool isLoading,  String? successMessage,  String? errorMessage,  String? usernameError,  String? passwordError)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileFormState() when $default != null:
return $default(_that.username,_that.password,_that.isLoading,_that.successMessage,_that.errorMessage,_that.usernameError,_that.passwordError);case _:
  return null;

}
}

}

/// @nodoc


class _UserProfileFormState implements UserProfileFormState {
  const _UserProfileFormState({this.username = '', this.password = '', this.isLoading = false, this.successMessage, this.errorMessage, this.usernameError, this.passwordError});
  

@override@JsonKey() final  String username;
@override@JsonKey() final  String password;
@override@JsonKey() final  bool isLoading;
@override final  String? successMessage;
@override final  String? errorMessage;
@override final  String? usernameError;
@override final  String? passwordError;

/// Create a copy of UserProfileFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileFormStateCopyWith<_UserProfileFormState> get copyWith => __$UserProfileFormStateCopyWithImpl<_UserProfileFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileFormState&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.usernameError, usernameError) || other.usernameError == usernameError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError));
}


@override
int get hashCode => Object.hash(runtimeType,username,password,isLoading,successMessage,errorMessage,usernameError,passwordError);

@override
String toString() {
  return 'UserProfileFormState(username: $username, password: $password, isLoading: $isLoading, successMessage: $successMessage, errorMessage: $errorMessage, usernameError: $usernameError, passwordError: $passwordError)';
}


}

/// @nodoc
abstract mixin class _$UserProfileFormStateCopyWith<$Res> implements $UserProfileFormStateCopyWith<$Res> {
  factory _$UserProfileFormStateCopyWith(_UserProfileFormState value, $Res Function(_UserProfileFormState) _then) = __$UserProfileFormStateCopyWithImpl;
@override @useResult
$Res call({
 String username, String password, bool isLoading, String? successMessage, String? errorMessage, String? usernameError, String? passwordError
});




}
/// @nodoc
class __$UserProfileFormStateCopyWithImpl<$Res>
    implements _$UserProfileFormStateCopyWith<$Res> {
  __$UserProfileFormStateCopyWithImpl(this._self, this._then);

  final _UserProfileFormState _self;
  final $Res Function(_UserProfileFormState) _then;

/// Create a copy of UserProfileFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,Object? isLoading = null,Object? successMessage = freezed,Object? errorMessage = freezed,Object? usernameError = freezed,Object? passwordError = freezed,}) {
  return _then(_UserProfileFormState(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,usernameError: freezed == usernameError ? _self.usernameError : usernameError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
