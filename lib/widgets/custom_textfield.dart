import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onSuffixIconPressed;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final bool isPassword;
  final bool enabled;

  const CustomTextField({
    super.key,
    this.controller,
    this.label = '',
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.isPassword = false,
    this.enabled = true, // Default to false
  });

  // Email
  factory CustomTextField.email({
    Key? key,
    TextEditingController? controller,
    String label = 'Email',
    String? errorText,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
    void Function(String)? onChanged,
    bool enabled = true,
  }) {
    return CustomTextField(
      key: key,
      controller: controller,
      label: label,
      errorText: errorText,
      validator: validator ?? _defaultEmailValidator,
      onSaved: onSaved,
      onChanged: onChanged,
      enabled: enabled,
    );
  }

  // Password
  factory CustomTextField.password({
    Key? key,
    TextEditingController? controller,
    String label = 'Password',
    String? errorText,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
    void Function(String)? onChanged,
    bool enabled = true,
  }) {
    return CustomTextField(
      key: key,
      controller: controller,
      label: label,
      errorText: errorText,
      isPassword: true,
      validator: validator ?? _defaultPasswordValidator,
      onSaved: onSaved,
      onChanged: onChanged,
      enabled: enabled,
    );
  }

  factory CustomTextField.confirmPassword({
    Key? key,
    TextEditingController? controller,
    String label = 'Confirm Password',
    String? errorText,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
    void Function(String)? onChanged,
    bool enabled = true,
  }) {
    return CustomTextField(
      key: key,
      controller: controller,
      label: label,
      errorText: errorText,
      isPassword: true,
      validator: validator ?? _defaultPasswordValidator,
      onSaved: onSaved,
      onChanged: onChanged,
      enabled: enabled,
    );
  }

  // Username
  factory CustomTextField.username({
    Key? key,
    TextEditingController? controller,
    String label = 'Username',
    String? errorText,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
    void Function(String)? onChanged,
    bool enabled = true,
  }){
    return CustomTextField(
      key: key,
      controller: controller,
      label: label,
      errorText: errorText,
      validator: validator ?? _defaultUsernameValidator,
      onSaved: onSaved,
      onChanged: onChanged,
      enabled: enabled,
    );
  }

  // OTP
  factory CustomTextField.otp({
    Key? key,
    TextEditingController? controller,
    String label = 'OTP',
    String? errorText,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
    void Function(String)? onChanged,
    bool enabled = true,
  }){
    return CustomTextField(
      key: key,
      controller: controller,
      label: label,
      errorText: errorText,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      enabled: enabled,
    );
  }
  
  factory CustomTextField.phone({
    Key? key,
    TextEditingController? controller,
    String label = 'Phone',
    String hintText = '+63xxxxxxxxxx',
    String? errorText,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
    void Function(String)? onChanged,
    bool enabled = true,
  }){
    return CustomTextField(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      errorText: errorText,
      validator: validator ?? _defaultPhoneValidator,
      onSaved: onSaved,
      onChanged: onChanged,
      enabled: enabled,
    );
  }

  static String? _defaultEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? _defaultPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  static String? _defaultUsernameValidator(String? value){
    if(value == null || value.isEmpty){
      return 'Username is required';
    }
    if(value.length < 5) {
      return 'Username should be atleast 5 characters';
    }
    return null;
  }

  static String? _defaultPhoneValidator(String? value) {
    if(value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
    if(!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
      return 'Please enter a valid phone number.';
    }
    return null;
  }

  String? _defaultTextFieldValidator(String? value){
    if(value == null || value.isEmpty) {
      return '$label is required.';
    }

    return null;
  }

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword ? true : widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        label: Text(widget.label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : (widget.suffixIcon != null
                  ? IconButton(
                      icon: widget.suffixIcon!,
                      onPressed: widget.onSuffixIconPressed,
                    )
                  : null),
        errorText: widget.errorText,
      ),

      validator: widget.validator ?? widget._defaultTextFieldValidator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
    );
  }
}
