import 'package:mobx_triple/mobx_triple.dart';
import 'package:temperatureapp/layers/domain/entities/data/repositories/getforecast_repository_imp.dart';

import '../layers/domain/entities/data/dto/forecast_dto.dart';

class ForecastStore extends MobXStore<Exception, ForecastModelDto> {
  final FetchForecastRepositoryImp repository;
  ForecastStore(this.repository) : super(ForecastModelDto(descriptionDto: '', forecastDto: [], nameDto: '', temperatureDto: '', windDto: ''));

  Future<void> add(String name) async {
    try {
      setLoading(true);
      await Future.delayed(const Duration(seconds: 2));
     ForecastModelDto result = await repository.fetchForecast(name);
     update(result);
      setLoading(false);
    } catch (e) {
      setError(Exception(e));
    }
  }
}
