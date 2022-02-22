import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:angleswing_skill_assesment/application/map_coordinates_bloc/mapcoordinates_bloc.dart';
import 'package:angleswing_skill_assesment/presentation/home_screen.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MapcoordinatesBloc>(
          create: (context) => MapcoordinatesBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.deepPurple,
            elevation: 0.0,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
