import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temperatureapp/bloc/bloc_forecast_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
import 'package:temperatureapp/layers/domain/entities/repositories/fetchForecast_repository.dart';

class RepositoryMock extends Mock implements FetchForecastRepository {}

main() {
  FetchForecastRepository repository = RepositoryMock();
  final bloc = BlocForecastBloc(repository);
  blocTest<BlocForecastBloc, BlocForecastState>(
    'If fetch was sucessful',
    build: () {
      when(() => repository.fetchForecast(any()))
          .thenAnswer((invocation) async => ForecastsModelEntity());
      return bloc;
    },
    act: (bloc) => bloc.add(const SearchForecastEvent('Texas')),
    expect: () => [isA<LoadForecastState>(), isA<SuccessForecastState>()],
  );

  blocTest<BlocForecastBloc, BlocForecastState>(
    'If forecast is null',
    build: () {
      when(() => repository.fetchForecast(any())).thenThrow(Exception());
      return bloc;
    },
    act: (bloc) => bloc.add(const SearchForecastEvent('Texas')),
    expect: () => [isA<LoadForecastState>(), isA<ErrorForecastState>()],
  );
}
