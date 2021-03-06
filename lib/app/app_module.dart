import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temperatureapp/layers/domain/entities/data/datasources/remote/fetchforecast_datasource_remote_imp.dart';
import 'package:temperatureapp/triple/forecastStore.dart';
import '../bloc/bloc_forecast_bloc.dart';
import '../layers/domain/entities/data/repositories/getforecast_repository_imp.dart';
import '../layers/domain/entities/usecases/get_forecast/get_forecast_usecase_imp.dart';
import '../layers/presentation/controllers/ui/pages/firstpage.dart';
import '../layers/presentation/controllers/ui/pages/forecast_page.dart';

class AppModule extends Module {
  
  @override
  final List<Bind> binds = [
    Bind((i) => FetchForecastDataSourceExternalImp(i.get())),
    Bind((i) => FetchForecastRepositoryImp(i.get())),
    Bind((i) => BlocForecastBloc(i.get())),
    Bind((i) => GetForecastUseCaseImp(i.get())),
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
            child: (_, __) =>  FirstPage(),
                ),
      ];
}
