import 'package:temperatureapp/layers/domain/entities/data/datasources/fetchforecast_datasource.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
import 'package:temperatureapp/layers/domain/entities/repositories/fetchForecast_repository.dart';

import '../dto/forecast_dto.dart';

class FetchForecastRepositoryImp implements FetchForecastRepository {
  final FetchForecastDataSource _fetchForecastDataSource;

  FetchForecastRepositoryImp(this._fetchForecastDataSource);

  @override
  Future<ForecastsModelEntity> fetchForecast(String city) async {
    final ForecastModelDto forecastModelDto =
        await _fetchForecastDataSource.fetch(city);
    return ForecastsModelEntity(
        description: forecastModelDto.descriptionDto,
        forecast: forecastModelDto.forecastDto,
        name: forecastModelDto.nameDto,
        temperature: forecastModelDto.temperatureDto,
        wind: forecastModelDto.windDto);
  }
}
