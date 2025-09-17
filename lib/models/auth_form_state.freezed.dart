// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFormState {

 String get email; String get username; String get phone; String get otp; String get password; String get confirmPassword; bool get isLoading; bool get obscurePassword; bool get obscureConfirmPassword; bool get navigateToVerification; String? get successMessage; String? get errorMessage; String? get emailError; String? get passwordError; String? get confirmPasswordError; String? get usernameError; String? get phoneError; String? get otpError;
/// Create a copy of AuthFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFormStateCopyWith<AuthFormState> get copyWith => _$AuthFormStateCopyWithImpl<AuthFormState>(this as AuthFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFormState&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword)&&(identical(other.obscureConfirmPassword, obscureConfirmPassword) || other.obscureConfirmPassword == obscureConfirmPassword)&&(identical(other.navigateToVerification, navigateToVerification) || other.navigateToVerification == navigateToVerification)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.usernameError, usernameError) || other.usernameError == usernameError)&&(identical(other.phoneError, phoneError) || other.phoneError == phoneError)&&(identical(other.otpError, otpError) || other.otpError == otpError));
}


@override
int get hashCode => Object.hash(runtimeType,email,username,phone,otp,password,confirmPassword,isLoading,obscurePassword,obscureConfirmPassword,navigateToVerification,successMessage,errorMessage,emailError,passwordError,confirmPasswordError,usernameError,phoneError,otpError);

@override
String toString() {
  return 'AuthFormState(email: $email, username: $username, phone: $phone, otp: $otp, password: $password, confirmPassword: $confirmPassword, isLoading: $isLoading, obscurePassword: $obscurePassword, obscureConfirmPassword: $obscureConfirmPassword, navigateToVerification: $navigateToVerification, successMessage: $successMessage, errorMessage: $errorMessage, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, usernameError: $usernameError, phoneError: $phoneError, otpError: $otpError)';
}


}

/// @nodoc
abstract mixin class $AuthFormStateCopyWith<$Res>  {
  factory $AuthFormStateCopyWith(AuthFormState value, $Res Function(AuthFormState) _then) = _$AuthFormStateCopyWithImpl;
@useResult
$Res call({
 String email, String username, String phone, String otp, String password, String confirmPassword, bool isLoading, bool obscurePassword, bool obscureConfirmPassword, bool navigateToVerification, String? successMessage, String? errorMessage, String? emailError, String? passwordError, String? confirmPasswordError, String? usernameError, String? phoneError, String? otpError
});




}
/// @nodoc
class _$AuthFormStateCopyWithImpl<$Res>
    implements $AuthFormStateCopyWith<$Res> {
  _$AuthFormStateCopyWithImpl(this._self, this._then);

  final AuthFormState _self;
  final $Res Function(AuthFormState) _then;

/// Create a copy of AuthFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? username = null,Object? phone = null,Object? otp = null,Object? password = null,Object? confirmPassword = null,Object? isLoading = null,Object? obscurePassword = null,Object? obscureConfirmPassword = null,Object? navigateToVerification = null,Object? successMessage = freezed,Object? errorMessage = freezed,Object? emailError = freezed,Object? passwordError = freezed,Object? confirmPasswordError = freezed,Object? usernameError = freezed,Object? phoneError = freezed,Object? otpError = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,obscureConfirmPassword: null == obscureConfirmPassword ? _self.obscureConfirmPassword : obscureConfirmPassword // ignore: cast_nullable_to_non_nullable
as bool,navigateToVerification: null == navigateToVerification ? _self.navigateToVerification : navigateToVerification // ignore: cast_nullable_to_non_nullable
as bool,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,usernameError: freezed == usernameError ? _self.usernameError : usernameError // ignore: cast_nullable_to_non_nullable
as String?,phoneError: freezed == phoneError ? _self.phoneError : phoneError // ignore: cast_nullable_to_non_nullable
as String?,otpError: freezed == otpError ? _self.otpError : otpError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthFormState].
extension AuthFormStatePatterns on AuthFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthFormState value)  $default,){
final _that = this;
switch (_that) {
case _AuthFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthFormState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String username,  String phone,  String otp,  String password,  String confirmPassword,  bool isLoading,  bool obscurePassword,  bool obscureConfirmPassword,  bool navigateToVerification,  String? successMessage,  String? errorMessage,  String? emailError,  String? passwordError,  String? confirmPasswordError,  String? usernameError,  String? phoneError,  String? otpError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthFormState() when $default != null:
return $default(_that.email,_that.username,_that.phone,_that.otp,_that.password,_that.confirmPassword,_that.isLoading,_that.obscurePassword,_that.obscureConfirmPassword,_that.navigateToVerification,_that.successMessage,_that.errorMessage,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.usernameError,_that.phoneError,_that.otpError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String username,  String phone,  String otp,  String password,  String confirmPassword,  bool isLoading,  bool obscurePassword,  bool obscureConfirmPassword,  bool navigateToVerification,  String? successMessage,  String? errorMessage,  String? emailError,  String? passwordError,  String? confirmPasswordError,  String? usernameError,  String? phoneError,  String? otpError)  $default,) {final _that = this;
switch (_that) {
case _AuthFormState():
return $default(_that.email,_that.username,_that.phone,_that.otp,_that.password,_that.confirmPassword,_that.isLoading,_that.obscurePassword,_that.obscureConfirmPassword,_that.navigateToVerification,_that.successMessage,_that.errorMessage,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.usernameError,_that.phoneError,_that.otpError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String username,  String phone,  String otp,  String password,  String confirmPassword,  bool isLoading,  bool obscurePassword,  bool obscureConfirmPassword,  bool navigateToVerification,  String? successMessage,  String? errorMessage,  String? emailError,  String? passwordError,  String? confirmPasswordError,  String? usernameError,  String? phoneError,  String? otpError)?  $default,) {final _that = this;
switch (_that) {
case _AuthFormState() when $default != null:
return $default(_that.email,_that.username,_that.phone,_that.otp,_that.password,_that.confirmPassword,_that.isLoading,_that.obscurePassword,_that.obscureConfirmPassword,_that.navigateToVerification,_that.successMessage,_that.errorMessage,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.usernameError,_that.phoneError,_that.otpError);case _:
  return null;

}
}

}

/// @nodoc


class _AuthFormState implements AuthFormState {
  const _AuthFormState({this.email = '', this.username = '', this.phone = '', this.otp = '', this.password = '', this.confirmPassword = '', this.isLoading = false, this.obscurePassword = false, this.obscureConfirmPassword = false, this.navigateToVerification = false, this.successMessage, this.errorMessage, this.emailError, this.passwordError, this.confirmPasswordError, this.usernameError, this.phoneError, this.otpError});
  

@override@JsonKey() final  String email;
@override@JsonKey() final  String username;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String otp;
@override@JsonKey() final  String password;
@override@JsonKey() final  String confirmPassword;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool obscurePassword;
@override@JsonKey() final  bool obscureConfirmPassword;
@override@JsonKey() final  bool navigateToVerification;
@override final  String? successMessage;
@override final  String? errorMessage;
@override final  String? emailError;
@override final  String? passwordError;
@override final  String? confirmPasswordError;
@override final  String? usernameError;
@override final  String? phoneError;
@override final  String? otpError;

/// Create a copy of AuthFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthFormStateCopyWith<_AuthFormState> get copyWith => __$AuthFormStateCopyWithImpl<_AuthFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFormState&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword)&&(identical(other.obscureConfirmPassword, obscureConfirmPassword) || other.obscureConfirmPassword == obscureConfirmPassword)&&(identical(other.navigateToVerification, navigateToVerification) || other.navigateToVerification == navigateToVerification)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.usernameError, usernameError) || other.usernameError == usernameError)&&(identical(other.phoneError, phoneError) || other.phoneError == phoneError)&&(identical(other.otpError, otpError) || other.otpError == otpError));
}


@override
int get hashCode => Object.hash(runtimeType,email,username,phone,otp,password,confirmPassword,isLoading,obscurePassword,obscureConfirmPassword,navigateToVerification,successMessage,errorMessage,emailError,passwordError,confirmPasswordError,usernameError,phoneError,otpError);

@override
String toString() {
  return 'AuthFormState(email: $email, username: $username, phone: $phone, otp: $otp, password: $password, confirmPassword: $confirmPassword, isLoading: $isLoading, obscurePassword: $obscurePassword, obscureConfirmPassword: $obscureConfirmPassword, navigateToVerification: $navigateToVerification, successMessage: $successMessage, errorMessage: $errorMessage, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, usernameError: $usernameError, phoneError: $phoneError, otpError: $otpError)';
}


}

/// @nodoc
abstract mixin class _$AuthFormStateCopyWith<$Res> implements $AuthFormStateCopyWith<$Res> {
  factory _$AuthFormStateCopyWith(_AuthFormState value, $Res Function(_AuthFormState) _then) = __$AuthFormStateCopyWithImpl;
@override @useResult
$Res call({
 String email, String username, String phone, String otp, String password, String confirmPassword, bool isLoading, bool obscurePassword, bool obscureConfirmPassword, bool navigateToVerification, String? successMessage, String? errorMessage, String? emailError, String? passwordError, String? confirmPasswordError, String? usernameError, String? phoneError, String? otpError
});




}
/// @nodoc
class __$AuthFormStateCopyWithImpl<$Res>
    implements _$AuthFormStateCopyWith<$Res> {
  __$AuthFormStateCopyWithImpl(this._self, this._then);

  final _AuthFormState _self;
  final $Res Function(_AuthFormState) _then;

/// Create a copy of AuthFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? username = null,Object? phone = null,Object? otp = null,Object? password = null,Object? confirmPassword = null,Object? isLoading = null,Object? obscurePassword = null,Object? obscureConfirmPassword = null,Object? navigateToVerification = null,Object? successMessage = freezed,Object? errorMessage = freezed,Object? emailError = freezed,Object? passwordError = freezed,Object? confirmPasswordError = freezed,Object? usernameError = freezed,Object? phoneError = freezed,Object? otpError = freezed,}) {
  return _then(_AuthFormState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,obscureConfirmPassword: null == obscureConfirmPassword ? _self.obscureConfirmPassword : obscureConfirmPassword // ignore: cast_nullable_to_non_nullable
as bool,navigateToVerification: null == navigateToVerification ? _self.navigateToVerification : navigateToVerification // ignore: cast_nullable_to_non_nullable
as bool,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,usernameError: freezed == usernameError ? _self.usernameError : usernameError // ignore: cast_nullable_to_non_nullable
as String?,phoneError: freezed == phoneError ? _self.phoneError : phoneError // ignore: cast_nullable_to_non_nullable
as String?,otpError: freezed == otpError ? _self.otpError : otpError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
