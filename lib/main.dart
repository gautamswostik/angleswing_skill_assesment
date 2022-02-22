import 'package:angleswing_skill_assesment/app_setup/app.dart';
import 'package:angleswing_skill_assesment/app_setup/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      runApp(
        const App(),
      );
      BlocOverrides.current;
    },
    blocObserver: AppBlocObserver(),
  );
}
