import 'package:temperatureapp/layers/domain/entities/data/dto/forecast_dto.dart';

abstract class FetchForecastDataSource{
  Future<ForecastModelDto> fetch(String name);
}