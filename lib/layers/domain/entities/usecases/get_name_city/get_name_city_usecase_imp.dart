import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
import 'package:temperatureapp/layers/domain/entities/usecases/get_name_city/get_name_city_usecase.dart';

class GetNameCityUseCaseImp implements GetNameCityUseCase{
  @override
  ForecastsModelEntity getName(String city) {
    if(city == '')
    {
      return ForecastsModelEntity(name: 'Not Avaiable');
    }
    return ForecastsModelEntity();
  }

}