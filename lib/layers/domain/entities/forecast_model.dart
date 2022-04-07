class ForecastsModelEntity{
  String? temperature;
  String? wind;
  String? description;
  late String name = '';
  List<Forecast>? forecast;

  ForecastsModelEntity(
      {this.temperature,
      this.wind,
      this.description,
      this.forecast,
      this.name = ''});
}

class Forecast {
  String day = '';
  String temperature = '';
  String wind = '';

  Forecast({required this.day, required this.temperature, required this.wind});
}