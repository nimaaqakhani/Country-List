import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/Di/injection.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/screens/simple_login_screen.dart';
import 'package:flutter_application_1/features/Auth/presentation/screens/modern_login_screen.dart';
import 'package:flutter_application_1/features/Auth/presentation/screens/advanced_login_screen.dart';
import 'package:flutter_application_1/features/Auth/presentation/screens/login_selector_screen.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/screens/country_list_screen.dart';
import 'package:flutter_application_1/features/splash/presentation/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash', // تغییر به splash
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login-selector',
        builder: (context, state) => const LoginSelectorScreen(),
      ),
      GoRoute(
        path: '/login/simple',
        builder: (context, state) => BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
          child: const SimpleLoginScreen(successRoute: '/home'),
        ),
      ),
      GoRoute(
        path: '/login/modern',
        builder: (context, state) => BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
          child: const ModernLoginScreen(successRoute: '/home'),
        ),
      ),
      GoRoute(
        path: '/login/advanced',
        builder: (context, state) => BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
          child: const AdvancedLoginScreen(successRoute: '/home'),
        ),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => BlocProvider<CountryBloc>(
          create: (context) => getIt<CountryBloc>()..add(const FetchCountries()),
          child: const CountryListScreen(),
        ),
      ),
    ],
  );
}