import 'package:flutter_application_1/features/GlobalCountries/presentation/screens/country_list_screen.dart';
import 'package:flutter_application_1/features/splash/presentation/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const CountryListScreen(),
      ),
    ],
  );
}
