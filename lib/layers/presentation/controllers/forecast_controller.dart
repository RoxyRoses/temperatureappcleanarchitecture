import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
import 'package:temperatureapp/layers/domain/entities/usecases/get_forecast/get_forecast_usecase.dart';

class ForecastController {
  final GetForecastCityUseCase _getForecastCityUseCase;

  ForecastController(this._getForecastCityUseCase);

  ForecastsModelEntity forecast = ForecastsModelEntity();

  fetchForecast(String city) async {
    forecast = await _getForecastCityUseCase.fetchForecast(city);
  }
}
