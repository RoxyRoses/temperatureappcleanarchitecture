import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temperatureapp/app/app_module.dart';
import 'package:temperatureapp/view/firstpage.dart';
import 'package:temperatureapp/view/forecast_page.dart';
import 'bloc/bloc_forecast_bloc.dart';
import 'layers/domain/entities/forecast_model.dart';
import 'layers/domain/entities/repositories/getforecast_repository.dart';
import 'myapp.dart';

final ForecastsModelEntity forecast = ForecastsModelEntity();

void main() {
  runApp(ModularApp(module:AppModule(), child: const MyApp()));
}

