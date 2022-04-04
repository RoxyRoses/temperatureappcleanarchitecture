import 'package:flutter_test/flutter_test.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';

main() {
  test('expects the entity is not null', () {
    //entidade não nula
    ForecastsModelEntity forecastsModelEntity = ForecastsModelEntity(
        description: 'teste',
        name: 'teste',
        temperature: 'teste3',
        wind: '20',
        forecast: []);
    expect(forecastsModelEntity, isNotNull);
  });
}
