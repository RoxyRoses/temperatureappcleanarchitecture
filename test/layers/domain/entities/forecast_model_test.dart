import 'package:flutter_test/flutter_test.dart';
import 'package:temperatureapp/layers/domain/entities/data/datasources/remote/fetchforecast_datasource_remote_imp.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
import 'package:temperatureapp/layers/domain/entities/usecases/get_forecast/get_forecast_usecase.dart';
import 'package:temperatureapp/layers/domain/entities/usecases/get_forecast/get_forecast_usecase_imp.dart';

import 'usecases/get_forecast/get_forecast_test.dart';

main() {
  test('expects the entity is not null', () {
    GetForecastCityUseCase useCase = GetForecastUseCaseImp(FetchForecastRepositoryImp());
    //entidade não nula

    var result = useCase.fetchForecast('Texas');
    
    expect(result, isInstanceOf<Future<ForecastsModelEntity>>());
  });
}
