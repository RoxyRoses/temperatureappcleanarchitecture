import 'package:flutter_test/flutter_test.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
main() {

  setUpAll((){print('Inicia o suite');});

  tearDownAll((){print('Destruir o suite');});

  test('expects the entity is not null', () {
    final forecast = ForecastsModelEntity(description: 'sun', name: 'Salvador', forecast: [], temperature: '30C', wind: '30');
      expect(forecast, isNotNull);
  });

}
