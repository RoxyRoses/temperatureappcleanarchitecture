import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:temperatureapp/layers/domain/entities/data/repositories/getforecast_repository_imp.dart';

import '../layers/domain/entities/data/dto/forecast_dto.dart';
import '../layers/domain/entities/forecast_model.dart';
import '../layers/domain/entities/repositories/fetchForecast_repository.dart';

part 'bloc_forecast_event.dart';
part 'bloc_forecast_state.dart';

class BlocForecastBloc extends Bloc<BlocForecastEvent, BlocForecastState> {
  final FetchForecastRepository repository;

  BlocForecastBloc(this.repository) : super(BlocForecastInitial()) {
    on<SearchForecastEvent>((event, emit) async {
      emit(LoadForecastState());
        try {
          final forecast = await repository.fetchForecast(event.name);
          if (forecast == null) {
            emit(
              const ErrorForecastState(message: 'Type the name of the city'),
            );
          } else {
            emit(
              SuccessForecastState(forecast),
            );
          }
        } catch (e) {
          emit(const ErrorForecastState(message: 'Something went wrong'));
        }
      }
    );
  }
}

Future<ForecastsModelEntity> fetchForecast(String model) async {
  ForecastsModelEntity forecast;
  try {
    var http;
    final response = await http.get(
      Uri.parse('https://goweather.herokuapp.com/weather/' +
          model.replaceAll(' ', '')),
    );
    await Future.delayed(const Duration(seconds: 2));
    forecast = ForecastModelDto.fromJson(jsonDecode(response.body));
    forecast.name = model[0].toUpperCase() + model.substring(1);
    return forecast;
  } on Exception catch (_) {
    throw Exception('Failed to load forecast');
  }
}
