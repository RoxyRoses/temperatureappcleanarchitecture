import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temperatureapp/triple/forecastStore.dart';
import 'package:temperatureapp/view/forecast_page.dart';

import '../bloc/bloc_forecast_bloc.dart';
import '../layers/domain/entities/repositories/getforecast_repository.dart';
import '../view/firstpage.dart';

class AppModule extends Module {
  
  @override
  final List<Bind> binds = [
    Bind((i) => FetchForecastRepository(i.get())),
    Bind((i) => BlocForecastBloc(i.get())),
    Bind((i) => ForecastStore(i.get())),
    Bind((i) => Dio(BaseOptions(baseUrl: 'https://goweather.herokuapp.com'))),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/forecast',
          child: (_, args) => ForecastPage(forecast: args.data),
        ),
        ChildRoute(Modular.initialRoute,
            child: (_, __) =>  const FirstPage(),
                ),
      ];
}
