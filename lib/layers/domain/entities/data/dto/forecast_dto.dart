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
      data['forecast'] = forecastDto!.map((v) => v.toJson()).toList();
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
        forecastDto!.add(Forecast.fromJson(v));
      });
    }
  }
}

class ForecastListDto {
  String dayDto = '';
  String temperatureDto = '';
  String windDto = '';

  ForecastListDto(
      {required this.dayDto,
      required this.temperatureDto,
      required this.windDto});

    ForecastListDto.fromJson(Map<String, dynamic> json) {
    dayDto = json['day'];
    temperatureDto = json['temperature'];
    windDto = json['wind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = dayDto;
    data['temperature'] = temperatureDto;
    data['wind'] = windDto;
    return data;
  }
}
