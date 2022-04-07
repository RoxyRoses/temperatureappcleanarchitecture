import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temperatureapp/layers/domain/entities/data/datasources/remote/fetchforecast_datasource_remote_imp.dart';
import 'package:temperatureapp/layers/domain/entities/data/repositories/getforecast_repository_imp.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
import 'package:temperatureapp/layers/domain/entities/usecases/get_forecast/get_forecast_usecase_imp.dart';

void main() {

  var usecase = GetForecastUseCaseImp(
    FetchForecastRepositoryImp(
      FetchForecastDataSourceExternalImp(
        Dio(),
      ),
    ),
  );

  test('Should return the forecast', () {
    
    var result = usecase.fetchForecast('Texas');

    expect(
      result,
      isInstanceOf<Future<ForecastsModelEntity>>(),
    );
  });
}
