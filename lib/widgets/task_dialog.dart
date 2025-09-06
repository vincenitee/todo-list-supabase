import 'package:flutter/material.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';

class TaskDialog extends StatefulWidget {
  final String title;
  final void Function(String) onSubmit;

  const TaskDialog({
    super.key,
    this.title = 'Add Task',
    required this.onSubmit,
  });

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final _taskDialogFormKey = GlobalKey<FormState>();
  String _taskTitle = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Form(
          key: _taskDialogFormKey,
          child: CustomTextField(
            label: 'Task Title',
            onSaved: (value) => _taskTitle = value ?? 'Shano',
          ),
        ),
      ),
      actions: [
        AuthButton(
          label: 'Cancel',
          icon: Icons.close,
          backgroundColor: Colors.grey,
          onPressed: () => Navigator.pop(context),
        ),

        AuthButton(
          label: 'Submit',
          icon: Icons.save,
          onPressed: () {
            if (_taskDialogFormKey.currentState!.validate()) {
              _taskDialogFormKey.currentState!.save();

              widget.onSubmit(_taskTitle.trim());
              
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
