import 'package:flutter_application_1/core/Di/injection.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/screens/country_list_screen.dart';
import 'package:flutter_application_1/features/splash/presentation/screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Manages the app's navigation configuration using [GoRouter].
///
/// [AppRouter] is a static class that provides a single instance of [GoRouter] with defined routes.
/// It handles the app's initial starting point and available navigation paths.
/// This class also uses [BlocProvider] to inject [CountryBloc] into specific screens.
///
/// **Dependencies:**
/// - [go_router]: For navigation management.
/// - [flutter_bloc]: For injecting [CountryBloc] via [BlocProvider].
/// - [getIt]: Dependency injection from [Injection].
/// - [CountryBloc], [CountryEvent]: BLoC logic for [CountryListScreen].
/// - [SplashScreen], [CountryListScreen]: App screens.
///
/// **Usage Notes:**
/// - Ensure [Injection.init] is called before app startup for [getIt] to work.
/// - Initial route is `/splash`; navigation to `/home` must be triggered (e.g., via [context.go]).
class AppRouter {
  /// The static [GoRouter] instance that holds the navigation configuration.
  ///
  /// Configured with:
  /// - [initialLocation]: Set to `/splash` as the starting point.
  /// - [routes]: A list of navigation routes defined below.
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      /// Route for the splash screen.
      ///
      /// Path: `/splash`
      /// Displays: [SplashScreen]
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),

      /// Route for the home screen displaying the country list.
      ///
      /// Path: `/home`
      /// Displays: [CountryListScreen] wrapped in [BlocProvider] for [CountryBloc].
      /// - [create]: Instantiates [CountryBloc] via [getIt] and triggers [FetchCountries].
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