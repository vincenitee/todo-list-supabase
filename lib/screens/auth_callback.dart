import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:todo_list_supabase/providers/supabase_client_provider.dart';

class AuthCallbackScreen extends ConsumerStatefulWidget {
  const AuthCallbackScreen({super.key});

  @override
  ConsumerState<AuthCallbackScreen> createState() => _AuthCallbackScreenState();
}

class _AuthCallbackScreenState extends ConsumerState<AuthCallbackScreen> {
  @override
  void initState() {
    super.initState();
    _handleRedirect();
  }

  Future<void> _handleRedirect() async {
    final supabase = ref.read(supabaseClientProvider);
    // Fetches the url base
    final uri = Uri.base;
    try {
      await supabase.auth.getSessionFromUrl(uri);
      if(mounted) {
        context.go('/home');
      }
    } catch (e) {
      Logger().e('Error handling auth callback: $e');
      if(mounted) {
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center (child: CircularProgressIndicator()),
    );
  }
}