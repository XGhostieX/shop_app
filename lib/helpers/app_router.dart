import 'package:go_router/go_router.dart';

import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/on_boarding_screen.dart';
import '../screens/shop/search_screen.dart';
import '../screens/shop/shop_screen.dart';
import 'cashe_helper.dart';

abstract class AppRouter {
  static bool? onBoarding = CasheHelper.getData('onBoarding');
  static String? token = CasheHelper.getData('token');
  static const loginScreen = '/login';
  static const registerScreen = '/register';
  static const shopScreen = '/shop';
  static const searchScreen = '/search';
  static final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            if (onBoarding != null) {
              if (token != null) {
                return const ShopScreen();
              } else {
                return LoginScreen();
              }
            } else {
              return const OnBoardingScreen();
            }
          }),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: shopScreen,
        builder: (context, state) => const ShopScreen(),
      ),
      GoRoute(
        path: searchScreen,
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}
