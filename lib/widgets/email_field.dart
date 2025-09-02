import 'package:flutter/material.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';

class EmailField extends StatelessWidget{

  final TextEditingController? controller;

  const EmailField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Email',
      controller: controller,
    );
  }
}