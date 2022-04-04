import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';

abstract class GetForecastCityUseCase{
  Future<ForecastsModelEntity> fetchForecast(String city);
}