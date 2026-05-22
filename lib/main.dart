import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'features/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
