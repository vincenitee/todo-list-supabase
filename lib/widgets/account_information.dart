import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
import 'package:todo_list_supabase/providers/profile_provider.dart';
import 'package:todo_list_supabase/providers/user_profile_form_provider.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';

class AccountInformationSection extends ConsumerWidget {
  const AccountInformationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(userProfileFormProvider);
    final formNotifier = ref.read(userProfileFormProvider.notifier);

    final profileState = ref.watch(profileNotifierProvider);
    final authState = ref.watch(authNotifierProvider);

    final isProfileLoading = profileState.isLoading;
    final hasProfileError = profileState.hasError;
    final profileError = profileState.hasError
        ? profileState.error.toString()
        : null;

    final isLoading = isProfileLoading || formState.isLoading;
    final hasErrors = hasProfileError;
    final errorMessage = profileError;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person_outline, color: Colors.blue.shade700),
                const SizedBox(width: 8),
                const Text(
                  'Account Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Username
            CustomTextField.username(
              enabled: !isLoading,
              value: formState.username,
              onChanged: formNotifier.updateUsername,
              errorText: formState.usernameError,
            ),
            const SizedBox(height: 16),

            // Password
            CustomTextField.password(
              enabled: !isLoading,
              onChanged: formNotifier.updatePassword,
              errorText: formState.passwordError,
            ),
            const SizedBox(height: 16),

            // Show error messages from providers
            if (hasErrors) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        errorMessage ?? 'An error occurred',
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Show success message
            if (!isLoading &&
                !hasErrors &&
                (profileState.hasValue || authState.hasValue)) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Account updated successfully!',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            SizedBox(
              width: double.infinity,
              child: AuthButton(
                label: isLoading ? 'Saving changes...' : 'Save Changes',
                icon: isLoading ? Icons.hourglass_empty : Icons.save,
                onPressed: isLoading
                    ? () {} // Disable button when loading
                    : () => _handleSave(ref, formNotifier, formState),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSave(
    WidgetRef ref,
    dynamic formNotifier,
    dynamic formState,
  ) async {
    final profileNotifier = ref.read(profileNotifierProvider.notifier);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    // Validate the form
    if (!formNotifier.validate()) return;

    // Update username if provided
    if (formState.username.isNotEmpty) {
      await profileNotifier.updateUsername(formState.username);
    }

    // Update password if provided
    if (formState.password.isNotEmpty) {
      await authNotifier.updatePassword(formState.password);
    }

    // Clear form after successful update
    final profileState = ref.read(profileNotifierProvider);
    final authState = ref.read(authNotifierProvider);

    if (!profileState.hasError && !authState.hasError) {
      formNotifier.reset(); 
    }
  }
}
