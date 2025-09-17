import 'package:go_router/go_router.dart';
import 'package:todo_list_supabase/screens/auth_callback.dart';
import 'package:todo_list_supabase/screens/email_verification.dart';
import 'package:todo_list_supabase/screens/home.dart';
import 'package:todo_list_supabase/screens/login.dart';
import 'package:todo_list_supabase/screens/signup.dart';
import 'package:todo_list_supabase/screens/profile.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/', 
      builder: (context, state) => LoginScreen()
    ),
    GoRoute(
      path: '/home', 
      builder: (context, state) => HomeScreen()
    ),
    GoRoute(
      path: '/signup', 
      builder: (context, state) => SignupScreen()
    ),
    GoRoute(
      path: '/profiles',
      builder: (context, state) => ProfileScreen()
    ),
    GoRoute(
      path: '/email_verification',
      builder: (context, state) => EmailVerificationScreen()
    ),
    GoRoute(
      path: '/callback',
      builder: (context, state) => AuthCallbackScreen(),
    ),
  ],
);
