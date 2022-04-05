import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temperatureapp/app/app_module.dart';
import 'layers/domain/entities/forecast_model.dart';
import 'myapp.dart';

final ForecastsModelEntity forecast = ForecastsModelEntity();

void main() {
  runApp(ModularApp(module:AppModule(), child: const MyApp()));
}

