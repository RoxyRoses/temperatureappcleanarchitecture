import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temperatureapp/layers/domain/entities/data/datasources/remote/fetchforecast_datasource_remote_imp.dart';

class DioMock extends Mock implements Dio{}
class RequestOptionsMock extends Mock implements RequestOptions{}

main(){
  var dioMock = DioMock();
  
  FetchForecastDataSourceExternalImp dataSourceExternalImp = FetchForecastDataSourceExternalImp(dioMock);

  test('check if forecast external is not null', (){
    when(() => dioMock.get(any())).thenAnswer((invocation) async => Response(requestOptions: RequestOptionsMock()));
    var result = dataSourceExternalImp.fetch('texas');

    expect(result, isNotNull);
  });

  test('check if forecast external gets an error', (){
    when(() => dioMock.get(any())).thenThrow(DioError(requestOptions:  RequestOptionsMock()));
    var result = dataSourceExternalImp.fetch('texas');

    expect(result, throwsA(isA<Exception>()));
  });
}