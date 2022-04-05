import 'package:temperatureapp/layers/domain/entities/data/datasources/fetchforecast_datasource.dart';
import 'package:temperatureapp/layers/domain/entities/repositories/fetchForecast_repository.dart';

import '../dto/forecast_dto.dart';

class FetchForecastRepositoryImp extends FetchForecastRepository {
  final FetchForecastDataSource _fetchForecastDataSource;

  FetchForecastRepositoryImp(this._fetchForecastDataSource);

  @override
  Future<ForecastModelDto> fetchForecast(String city) async {
    return _fetchForecastDataSource.fetch(city);
  }
}
