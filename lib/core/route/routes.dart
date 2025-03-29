import 'package:flutter_application_1/core/constant/auth_bloc_providers.dart';
import 'package:flutter_application_1/core/constant/country_bloc_providers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/core/constant/app_constant.dart';
import 'package:flutter_application_1/core/utils/router_utils.dart';
import 'package:flutter_application_1/features/Auth/presentation/screens/advanced_login_screen.dart';
import 'package:flutter_application_1/features/Auth/presentation/screens/login_selector_screen.dart';
import 'package:flutter_application_1/features/Auth/presentation/screens/modern_login_screen.dart';
import 'package:flutter_application_1/features/Auth/presentation/screens/simple_login_screen.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/screens/country_list_screen.dart';
import 'package:flutter_application_1/features/splash/presentation/screen/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppConstants.splash,
    routes: [
      GoRoute(
        path: AppConstants.splash,
        name: AppConstants.splash,
        pageBuilder: (context, state) => transitionPage(
          const SplashScreen(),
          beginOffset: PageTransitionDirection.toUp.offset,
        ),
      ),
      GoRoute(
        path: AppConstants.loginSelector,
        name: AppConstants.loginSelector,
        pageBuilder: (context, state) => transitionPage(
          const LoginSelectorScreen(),
          beginOffset: PageTransitionDirection.toUp.offset,
        ),
      ),
      GoRoute(
        path: AppConstants.loginBase,
        name: AppConstants.loginBase,
        pageBuilder: (context, state) => transitionPage(
          MultiBlocProvider(
            providers: [
              AuthBlocProviders.authBloc,
            ],
            child: const SimpleLoginScreen(successRoute: AppConstants.home),
          ),
          beginOffset: PageTransitionDirection.toUp.offset,
        ),
        routes: [
          GoRoute(
            path: AppConstants.loginSimple,
            name: AppConstants.loginSimple,
            pageBuilder: (context, state) => transitionPage(
              MultiBlocProvider(
                providers: [
                  AuthBlocProviders.authBloc,
                ],
                child: const SimpleLoginScreen(successRoute: AppConstants.home),
              ),
              beginOffset: PageTransitionDirection.toLeft.offset,
            ),
          ),
          GoRoute(
            path: AppConstants.loginModern,
            name: AppConstants.loginModern,
            pageBuilder: (context, state) => transitionPage(
              MultiBlocProvider(
                providers: [
                  AuthBlocProviders.authBloc,
                ],
                child: const ModernLoginScreen(successRoute: AppConstants.home),
              ),
              beginOffset: PageTransitionDirection.toLeft.offset,
            ),
          ),
          GoRoute(
            path: AppConstants.loginAdvanced,
            name: AppConstants.loginAdvanced,
            pageBuilder: (context, state) => transitionPage(
              MultiBlocProvider(
                providers: [
                  AuthBlocProviders.authBloc,
                ],
                child:
                    const AdvancedLoginScreen(successRoute: AppConstants.home),
              ),
              beginOffset: PageTransitionDirection.toLeft.offset,
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppConstants.home,
        name: AppConstants.home,
        pageBuilder: (context, state) => transitionPage(
          MultiBlocProvider(
            providers: [
              CountryBlocProviders.countryBloc,
            ],
            child: const CountryListScreen(),
          ),
          beginOffset: PageTransitionDirection.toUp.offset,
        ),
      ),
    ],
  );
}
