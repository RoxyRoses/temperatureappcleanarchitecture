import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';

class ForecastModelDto extends ForecastsModelEntity {
  String? temperatureDto;
  String? windDto;
  String? descriptionDto;
  late String nameDto = '';
  List<Forecast>? forecastDto;

  ForecastModelDto(
      {required this.temperatureDto,
      required this.windDto,
      required this.descriptionDto,
      required this.nameDto,
      required this.forecastDto})
      : super(
            description: descriptionDto,
            wind: windDto,
            temperature: temperatureDto,
            name: nameDto,
            forecast: forecastDto);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temperature'] = temperatureDto;
    data['wind'] = windDto;
    data['description'] = descriptionDto;
    if (forecastDto != null) {
      data['forecast'] =
          forecastDto!.map((v) => ForecastListDto().toJson(v)).toList();
    }
    return data;
  }

  ForecastModelDto.fromJson(Map<String, dynamic> json) {
    temperatureDto = json['temperature'];
    windDto = json['wind'];
    descriptionDto = json['description'];
    if (json['forecast'] != null) {
      forecastDto = <Forecast>[];
      json['forecast'].forEach((v) {
        forecastDto!.add(ForecastListDto.fromJson(v));
      });
    }
  }
}

class ForecastListDto {
  ForecastListDto();

  static Forecast fromJson(Map<String, dynamic> json) {
    final dayDto = json['day'];
    final temperatureDto = json['temperature'];
    final windDto = json['wind'];
    return Forecast(day: dayDto, temperature: temperatureDto, wind: windDto);
  }

  Map<String, dynamic> toJson(Forecast forecast) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = forecast.day;
    data['temperature'] = forecast.temperature;
    data['wind'] = forecast.wind;
    return data;
  }
}
