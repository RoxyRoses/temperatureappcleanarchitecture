import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temperatureapp/layers/domain/entities/data/datasources/remote/fetchforecast_datasource_remote_imp.dart';
import 'package:temperatureapp/layers/domain/entities/data/repositories/getforecast_repository_imp.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
import 'package:temperatureapp/layers/domain/entities/usecases/get_forecast/get_forecast_usecase.dart';
import 'package:temperatureapp/layers/domain/entities/usecases/get_forecast/get_forecast_usecase_imp.dart';
import 'package:temperatureapp/triple/forecastStore.dart';
import 'package:triple_test/triple_test.dart';

import '../../layers/data/repositories/fetchforecast_repository_test.dart';

class UseCaseMock extends Mock implements GetForecastCityUseCase {}

main() {
  ForecastStore forecastStore = ForecastStore(
    GetForecastUseCaseImp(
      FetchForecastRepositoryImp(
        FetchForecastDataSourceExternalImp(
          Dio(),
        ),
      ),
    ),
  );

   final GetForecastCityUseCase usecase = UseCaseMock();

  storeTest<ForecastStore>(
    'Testing triple',
    build: () {
    when(() => usecase.fetchForecast(any())).thenAnswer((invocation) async => ForecastsModelEntity());

      return ForecastStore(usecase);
    },
    act: (store) => store.add('Texas'),
    expect: () => [tripleLoading, tripleState, tripleLoading],
  );

  storeTest<ForecastStore>(
    'Testing triple error',
    build: () {
    when(() => usecase.fetchForecast(any())).thenThrow(Exception());

      return ForecastStore(usecase);
    },
    act: (store) => store.add('Texas'),
    expect: () => [tripleLoading, tripleError],
  );

}
