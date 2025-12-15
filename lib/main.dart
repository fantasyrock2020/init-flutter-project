import 'package:bloc/bloc.dart';
import 'package:core/di/injector.dart';
import 'package:flutter/material.dart';

import 'core/bloc/bloc_observer.dart';
import 'features/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
