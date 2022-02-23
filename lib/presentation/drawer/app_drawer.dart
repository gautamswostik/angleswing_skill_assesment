import 'package:angleswing_skill_assesment/application/isfromdrawer/isfromdrawer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key,
    required this.locations,
    required this.totalItemsLength,
  }) : super(key: key);
  final List<List<double>> locations;
  final int totalItemsLength;
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 212, 209, 209),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: widget.locations.map((e) {
              int index = widget.locations.indexOf(e);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<IsfromdrawerBloc>(context).add(
                      IsPressedIndex(
                        index: index,
                        lat: e.first,
                        lng: e.last,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: (index + 1) > widget.totalItemsLength
                          ? const Color.fromARGB(255, 133, 192, 240)
                          : Colors.white,
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
                          Text('Location ${index + 1}'),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.ltr,
                                children: const [
                                  Text('Lat'),
                                  Text('Long'),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              (index + 1) > widget.totalItemsLength
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      textDirection: TextDirection.ltr,
                                      children: [
                                        Text('${e.first} (Marker Lat)'),
                                        Text('${e.last} (Marker Long)'),
                                      ],
                                    )
                                  : Column(
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
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
