import 'package:flutter_application_1/core/Di/injection.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/screens/country_list_screen.dart';
import 'package:flutter_application_1/features/splash/presentation/screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        builder: (context, state) => BlocProvider<CountryBloc>(
          create: (context) => getIt<CountryBloc>()..add(const FetchCountries()),
          child: const CountryListScreen(),
        ),
      ),
    ],
  );
}