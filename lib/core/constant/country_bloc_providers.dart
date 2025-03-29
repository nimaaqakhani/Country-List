import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_bloc.dart';
import 'package:get_it/get_it.dart';

class CountryBlocProviders {
  CountryBlocProviders._();

  static final BlocProvider<CountryBloc> countryBloc =
      BlocProvider<CountryBloc>(
    create: (_) => GetIt.instance<CountryBloc>()..add(const FetchCountries()),
  );
}
