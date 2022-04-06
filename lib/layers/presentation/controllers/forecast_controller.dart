import 'package:temperatureapp/layers/domain/entities/usecases/get_forecast/get_forecast_usecase.dart';

class ForecastController{

  final GetForecastCityUseCase _getForecastCityUseCase;

  ForecastController(this._getForecastCityUseCase);

  fetchForecast(String city) async {
   var forecast = await _getForecastCityUseCase.fetchForecast(city);
  }
  
}