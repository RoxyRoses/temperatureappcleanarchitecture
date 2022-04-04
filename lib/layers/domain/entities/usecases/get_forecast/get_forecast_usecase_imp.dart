import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
import 'package:temperatureapp/layers/domain/entities/usecases/get_forecast/get_forecast_usecase.dart';

import '../../repositories/fetchForecast_repository.dart';

class GetForecastUseCaseImp implements GetForecastCityUseCase{
  
  final FetchForecastRepository _fetchForecastRepository;

  GetForecastUseCaseImp(this._fetchForecastRepository);
  
  @override
  Future<ForecastsModelEntity> fetchForecast(String city) async {
   var result = await _fetchForecastRepository.fetchForecast(city);
   return result;
  }

}