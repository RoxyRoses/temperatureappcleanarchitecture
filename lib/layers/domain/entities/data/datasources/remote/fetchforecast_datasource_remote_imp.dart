import 'package:dio/dio.dart';
import 'package:temperatureapp/layers/domain/entities/data/datasources/fetchforecast_datasource.dart';
import 'package:temperatureapp/layers/domain/entities/data/dto/forecast_dto.dart';

class FetchForecastDataSourceExternalImp extends FetchForecastDataSource{
  final Dio dio;

  FetchForecastDataSourceExternalImp(this.dio);
 
 @override
  Future<ForecastModelDto> fetch(String name) async {
    ForecastModelDto forecast;
    try {
      final response = await dio.get('/weather/' +
            name.replaceAll(' ', ''),
      );
      await Future.delayed(const Duration(seconds: 2));
      forecast = ForecastModelDto.fromJson(response.data);
      forecast.nameDto = name[0].toUpperCase() + name.substring(1);
      return forecast;
    } on Exception catch (_) {
      throw Exception('Failed to load forecast');
    }
  }

}