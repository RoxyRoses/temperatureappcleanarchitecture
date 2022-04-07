import 'package:mobx_triple/mobx_triple.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';

import '../layers/domain/entities/usecases/get_forecast/get_forecast_usecase_imp.dart';

class ForecastStore extends MobXStore<Exception, ForecastsModelEntity> {
  final GetForecastUseCaseImp usecase;
  ForecastStore(this.usecase) : super(ForecastsModelEntity());

  Future<void> add(String name) async {
    try {
      setLoading(true);
      await Future.delayed(const Duration(seconds: 2));
     ForecastsModelEntity result = await usecase.fetchForecast(name);
     update(result);
      setLoading(false);
    } catch (e) {
      setError(Exception(e));
    }
  }
}
