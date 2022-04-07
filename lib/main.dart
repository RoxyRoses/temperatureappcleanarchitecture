import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temperatureapp/app/app_module.dart';
import 'layers/presentation/controllers/ui/pages/myapp.dart';

void main() {
  runApp(ModularApp(module:AppModule(), child: const MyApp()));
}

