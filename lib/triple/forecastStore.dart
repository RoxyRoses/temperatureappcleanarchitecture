import 'package:mobx_triple/mobx_triple.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
import 'package:temperatureapp/model/forecast_repository.dart';

class ForecastStore extends MobXStore<Exception, ForecastsModelEntity> {
  final ForecastRepository repository;
  ForecastStore(this.repository) : super(ForecastsModelEntity());

  Future<void> add(String name) async {
    try {
      setLoading(true);
      await Future.delayed(const Duration(seconds: 2));
     final result = await repository.fetchForecast(name);
     update(result);
      setLoading(false);
    } catch (e) {
      setError(Exception(e));
    }
  }
}
