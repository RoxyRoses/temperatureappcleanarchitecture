import 'package:flutter_test/flutter_test.dart';
import 'package:temperatureapp/layers/domain/entities/data/dto/forecast_dto.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';

main() {
  setUpAll(() {
    print('Inicia o suite');
  });

  tearDownAll(() {
    print('Destruir o suite');
  });

  final ForecastModelDto forecastdto = ForecastModelDto(
      descriptionDto: 'Clear',
      forecastDto: <Forecast>[
        Forecast(day: "1", temperature: "30 °C", wind: "8 km/h"),
        Forecast(day: "2", temperature: "+27 °C", wind: "6 km/h"),
        Forecast(day: "3", temperature: " °C", wind: "9 km/h"),
      ],
      nameDto: '',
      temperatureDto: '+24 °C',
      windDto: '1 km/h');

  var json = {
    "temperature": "+24 °C",
    "wind": "1 km/h",
    "description": "Clear",
    "forecast": [
      {"day": "1", "temperature": "30 °C", "wind": "8 km/h"},
      {"day": "2", "temperature": "+27 °C", "wind": "6 km/h"},
      {"day": "3", "temperature": " °C", "wind": "9 km/h"}
    ]
  };

  group('fromjson | toJson', () {
    test('object should be turned into json', (() {
      var entity = forecastdto.toJson();

      expect(entity, equals((json))); 
    }));

    test('json should have turned into object', (() {
      var entity = ForecastModelDto.fromJson(json);

      expect(entity, equals((entity)));
    }));

    test('entity temperature must be the same from json temperature', (() {
      var entity = ForecastModelDto.fromJson(json);

      expect(entity.temperatureDto, equals((json.entries.first.value)));
    }));
  });
}
