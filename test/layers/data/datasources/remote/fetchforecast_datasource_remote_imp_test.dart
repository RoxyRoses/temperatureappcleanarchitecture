import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temperatureapp/layers/domain/entities/data/datasources/remote/fetchforecast_datasource_remote_imp.dart';

main(){
  
  FetchForecastDataSourceExternalImp dataSourceExternalImp = FetchForecastDataSourceExternalImp(Dio());

  test('return forecast external', (){
    var result = dataSourceExternalImp.fetch('texas');

    expect(result, isNotNull);
  });
}