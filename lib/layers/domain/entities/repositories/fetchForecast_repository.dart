import '../forecast_model.dart';

abstract class FetchForecastRepository{
  Future<ForecastsModelEntity> fetchForecast(String city);
}