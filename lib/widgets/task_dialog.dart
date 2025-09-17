import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:todo_list_supabase/models/task.dart';
import 'package:todo_list_supabase/providers/supabase_client_provider.dart';
import 'package:todo_list_supabase/providers/task_provider.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';

// TODO: FIX THIS APP DIALOG TO USE AS A BOTTOM SHEET

class TaskDialog extends ConsumerStatefulWidget {
  final String title;

  const TaskDialog({super.key, this.title = 'Add Task'});

  @override
  ConsumerState<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends ConsumerState<TaskDialog> {
  final _taskDialogFormKey = GlobalKey<FormState>();
  String _taskTitle = '';
  bool _isLoading = false;

  Future<void> _handleTaskSubmission(BuildContext context) async {
    final userId = ref.read(supabaseClientProvider).auth.currentUser?.id;

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You must be signed in to add a task.")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await ref
          .read(taskNotifierProvider.notifier)
          .addTask(Task(userId: userId, title: _taskTitle, isDone: false));

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Task added successfully!")));

      context.pop(); // close dialog only if success
    } catch (e) {
      Logger().e('Error adding task: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to add task: $e")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

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
            validator: (value) => (value == null || value.isEmpty)
                ? 'Please enter a task title'
                : null,
            onSaved: (value) => _taskTitle = value ?? '',
          ),
        ),
      ),
      actions: [
        AuthButton(
          label: _isLoading ? 'Saving...' : 'Submit',
          icon: Icons.save,
          onPressed: _isLoading
              ? () {}
              : () {
                  if (_taskDialogFormKey.currentState!.validate()) {
                    _taskDialogFormKey.currentState!.save();
                    _handleTaskSubmission(context);
                  }
                },
        ),
        AuthButton(
          label: 'Cancel',
          icon: Icons.close,
          backgroundColor: Colors.grey,
          onPressed: _isLoading ? () {} : () => context.pop(),
        ),
      ],
    );
  }
}
