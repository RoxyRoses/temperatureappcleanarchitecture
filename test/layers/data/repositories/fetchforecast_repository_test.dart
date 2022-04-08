import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temperatureapp/layers/domain/entities/data/datasources/fetchforecast_datasource.dart';
import 'package:temperatureapp/layers/domain/entities/data/dto/forecast_dto.dart';
import 'package:temperatureapp/layers/domain/entities/data/repositories/getforecast_repository_imp.dart';
import 'package:temperatureapp/layers/domain/entities/forecast_model.dart';
import 'package:temperatureapp/layers/domain/entities/repositories/fetchForecast_repository.dart';

class DataSourceMock extends Mock implements FetchForecastDataSource{}

main() {

  FetchForecastDataSource dataSource = DataSourceMock();
  FetchForecastRepository repository = FetchForecastRepositoryImp(dataSource);

  test('return forecast', () async {
    when(() => dataSource.fetch(any())).thenAnswer((invocation) async => ForecastModelDto(temperatureDto: '', windDto: '', descriptionDto: '', nameDto: '', forecastDto: []));
    var result = await repository.fetchForecast('Texas');

    expect(result, isNotNull);
    expect(result, isA<ForecastsModelEntity>());
  });

  test('Fetch not avaiable', () async {
    when(() => dataSource.fetch(any())).thenThrow(Exception());
    var result = repository.fetchForecast('Texas');

    expect(result, throwsA(isA<Exception>()));
  });
}
