import 'package:go_router/go_router.dart';

import '../screens/login_screen.dart';
import '../screens/on_boarding_screen.dart';

abstract class AppRouter {
  static const loginScreen = '/login';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
