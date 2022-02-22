import 'package:angleswing_skill_assesment/application/map_coordinates_bloc/mapcoordinates_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    BlocProvider.of<MapcoordinatesBloc>(context).add(GetMapCoodinates());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 212, 209, 209),
      child: BlocBuilder<MapcoordinatesBloc, MapcoordinatesState>(
        builder: (context, state) {
          if (state is MapcoordinatesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MappCoordinatesLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: state.mapCoordinates.locations
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.ltr,
                                children: [
                                  Text(
                                      'Location ${state.mapCoordinates.locations.indexOf(e) + 1}'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        textDirection: TextDirection.ltr,
                                        children: const [
                                          Text('Lat'),
                                          Text('Long'),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        textDirection: TextDirection.ltr,
                                        children: [
                                          Text('${e.first}'),
                                          Text('${e.last}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
