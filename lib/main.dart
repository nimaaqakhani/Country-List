import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Di/injection.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';
import 'package:flutter_application_1/core/route/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  Injection.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryBloc>(
      create: (context) => getIt<CountryBloc>()..add(FetchCountries()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
