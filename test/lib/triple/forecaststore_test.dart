import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temperatureapp/layers/domain/entities/data/datasources/fetchforecast_datasource.dart';
import 'package:temperatureapp/layers/domain/entities/data/datasources/remote/fetchforecast_datasource_remote_imp.dart';
import 'package:temperatureapp/layers/domain/entities/repositories/fetchForecast_repository.dart';
import 'package:temperatureapp/layers/domain/entities/usecases/get_forecast/get_forecast_usecase_imp.dart';
import 'package:temperatureapp/triple/forecastStore.dart';

import '../../layers/data/repositories/fetchforecast_repository_test.dart';

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

  test('Testing triple', (){
    var result = forecastStore.add('Texas');

    expect(result, isNotNull);
  });
}
