import 'package:dio/dio.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';

class ForecastRepository {
  final Dio dio;

  ForecastRepository(this.dio);

  Future<ForecastsModelEntity> fetchForecast(String city) async {
    ForecastsModelEntity forecast;
    try {
      final response = await dio.get('/weather/' +
            city.replaceAll(' ', ''),
      );
      await Future.delayed(const Duration(seconds: 2));
      forecast = ForecastsModelEntity.fromJson(response.data);
      forecast.name = city[0].toUpperCase() + city.substring(1);
      return forecast;
    } on Exception catch (_) {
      throw Exception('Failed to load forecast');
    }
  }
}