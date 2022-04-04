import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';

abstract class GetNameCityUseCase{
  ForecastsModelEntity getName(String city);
}