import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
import 'package:temperatureapp/layers/domain/entities/repositories/fetchForecast_repository.dart';
import 'package:temperatureapp/layers/domain/entities/usecases/get_forecast/get_forecast_usecase.dart';
import 'package:temperatureapp/layers/domain/entities/usecases/get_forecast/get_forecast_usecase_imp.dart';

class FetchForecastRepositoryImp implements FetchForecastRepository {
  
  @override
  Future<ForecastsModelEntity> fetchForecast(String city) async {
    ForecastsModelEntity forecast;
    Dio dio = Dio();
    try {
      final response = await dio.get('/weather/' +
            city.replaceAll(' ', ''),
      );
      await Future.delayed(const Duration(seconds: 2));
      forecast = ForecastsModelEntity.fromJson(response.data);
      forecast.name = city[0].toUpperCase() + city.substring(1);
      return forecast;
    } on Exception catch (_) {
      throw Exception('Failed to load forecast');
    }
  }
}

void main() {
  test('Should return the forecast', () {
    GetForecastCityUseCase useCase = GetForecastUseCaseImp(
      FetchForecastRepositoryImp(),
    );

    var result = useCase.fetchForecast('Texas');

    expect(
      result,
      isInstanceOf<Future<ForecastsModelEntity>>(),
    );
  });
}
