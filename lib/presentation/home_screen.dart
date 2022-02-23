import 'package:angleswing_skill_assesment/application/core/service/api_endpoints.dart';
import 'package:angleswing_skill_assesment/application/is_pressed/ispressed_bloc.dart';
import 'package:angleswing_skill_assesment/application/isfromdrawer/isfromdrawer_bloc.dart';
import 'package:angleswing_skill_assesment/application/map_coordinates_bloc/mapcoordinates_bloc.dart';
import 'package:angleswing_skill_assesment/presentation/drawer/app_drawer.dart';
import 'package:angleswing_skill_assesment/presentation/utils/custom_errorview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'map_controller_animated';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    BlocProvider.of<MapcoordinatesBloc>(context).add(GetMapCoodinates());
    super.initState();
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      GlobalKey<ScaffoldState>();

  MapController mapController = MapController();
  double currentZoom = 16.0;
  LatLng currentCenter = LatLng(37.56682245821738, 126.9778163539802);
  LatLng currentLocation = LatLng(0, 0);
  bool isOpen = false;
  void _zoomOut() {
    if (currentZoom == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You cannot zoom out any further'),
        ),
      );
    } else {
      currentZoom = currentZoom - 1;
      mapController.move(currentCenter, currentZoom);
    }
  }

  void _zoomIn() {
    if (currentZoom == 18) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You cannot zoom in any further'),
        ),
      );
    } else {
      currentZoom = currentZoom + 1;
      mapController.move(currentCenter, currentZoom);
    }
  }

  void permissionHandler() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }
//! Simple function to goto users current location
  // Future<LatLng> getCurrentLocation() async {
  //   permissionHandler();
  //   Location location = Location();

  //   LocationData _locationData;

  //   _locationData = await location.getLocation();

  //   setState(() {
  //     //_center = LatLng(_locationData.latitude, _locationData.longitude);

  //     mapController.move(
  //         LatLng(_locationData.latitude ?? 0, _locationData.longitude ?? 0),
  //         16.0);
  //   });
  //   return LatLng(_locationData.latitude ?? 0, _locationData.longitude ?? 0);
  // }
//! function to animate to users current location
  Future<LatLng> _animatedMoveForMap() async {
    permissionHandler();
    Location location = Location();

    LocationData _locationData;

    _locationData = await location.getLocation();

    final _latTween = Tween<double>(
        begin: mapController.center.latitude, end: _locationData.latitude);
    final _lngTween = Tween<double>(
        begin: mapController.center.longitude, end: _locationData.longitude);
    final _zoomTween = Tween<double>(begin: mapController.zoom, end: 16.0);

    var controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
          LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
          _zoomTween.evaluate(animation));
      currentCenter =
          LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation));
      currentZoom = _zoomTween.evaluate(animation);
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
    return LatLng(_locationData.latitude ?? 0, _locationData.longitude ?? 0);
  }

  void _animatedMapOnDrawerPop({
    required LatLng destLocation,
    required double destZoom,
  }) {
    permissionHandler();
    final _latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final _lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final _zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    var controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
          LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
          _zoomTween.evaluate(animation));
      currentCenter =
          LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation));
      currentZoom = _zoomTween.evaluate(animation);
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Angleswing Demo"),
        leading: IconButton(
          onPressed: () {
            if (_drawerscaffoldkey.currentState!.isDrawerOpen) {
              Navigator.pop(context);
            } else {
              _drawerscaffoldkey.currentState!.openDrawer();
            }
          },
          icon: isOpen
              ? const Icon(Icons.arrow_back_ios_new)
              : const Icon(Icons.menu),
        ),
      ),
      primary: true,
      body: BlocBuilder<MapcoordinatesBloc, MapcoordinatesState>(
        builder: (context, state) {
          if (state is MapcoordinatesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MappCoordinatesLoaded) {
            return Scaffold(
              key: _drawerscaffoldkey,
              onDrawerChanged: ((isOpened) => setState(() {
                    isOpen = isOpened;
                  })),
              drawer: AppDrawer(
                locations: state.mapCoordinates,
                totalItemsLength: state.index,
              ),
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 56),
                  FloatingActionButton(
                    onPressed: () {
                      if (currentLocation == LatLng(0, 0)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Current location not choosen yet'),
                          ),
                        );
                      } else {
                        BlocProvider.of<IspressedBloc>(context)
                            .add(IsPressedLocation(latLng: currentLocation));
                        BlocProvider.of<MapcoordinatesBloc>(context).add(
                            AddMapCoordinate(coordinates: [
                          currentLocation.latitude,
                          currentLocation.longitude
                        ]));
                      }
                    },
                    child: const Icon(Icons.gps_fixed),
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      _animatedMoveForMap().then((value) {
                        setState(() {
                          currentLocation = value;
                        });
                      });
                    },
                    child: const Icon(Icons.navigation),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      controller: mapController,
                      center: currentCenter,
                      zoom: currentZoom,
                      enableScrollWheel: true,
                      maxZoom: 18,
                      minZoom: 6,
                      onPositionChanged: (position, isGesture) {
                        if (isGesture) {
                          setState(() {
                            currentCenter = position.center ?? currentCenter;
                            currentZoom = position.zoom ?? currentZoom;
                          });
                        }
                      },
                    ),
                    nonRotatedLayers: [
                      TileLayerOptions(
                        urlTemplate: MapUrl.templteUrl,
                        additionalOptions: {
                          'accessToken': MapUrl.acceesToken,
                          'id': MapUrl.id,
                        },
                      ),
                      MarkerLayerOptions(
                        markers: [
                          ...state.mapCoordinates
                              .map(
                                (e) => Marker(
                                  point: LatLng(e.first, e.last),
                                  builder: (context) {
                                    return BlocConsumer<IsfromdrawerBloc,
                                            IsfromdrawerState>(
                                        listener: (contex, isPressedState) {
                                      if (isPressedState is IsDrawerIndex) {
                                        _animatedMapOnDrawerPop(
                                          destLocation: isPressedState.latLng,
                                          destZoom: 16,
                                        );
                                      }
                                    }, builder: (contex, isPressedState) {
                                      if (isPressedState is IsDrawerIndex) {
                                        int indexOfDrwerItem =
                                            state.mapCoordinates.indexOf(e);
                                        if (indexOfDrwerItem ==
                                            isPressedState.index) {
                                          return const Icon(
                                            Icons.push_pin,
                                            color: Colors.blue,
                                            size: 30,
                                          );
                                        }
                                      }
                                      return const Icon(
                                        Icons.push_pin,
                                        color: Colors.red,
                                        size: 30,
                                      );
                                    });
                                  },
                                ),
                              )
                              .toList(),
                          Marker(
                            point: currentLocation,
                            builder: (context) {
                              return BlocBuilder<IspressedBloc, IspressedState>(
                                  builder:
                                      (contex, isPressedCurrentPressedState) {
                                if (isPressedCurrentPressedState
                                    is IFPressedLocation) {
                                  return Stack(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Icon(
                                          Icons.location_on,
                                          color: Colors.blue,
                                          size: 30,
                                        ),
                                      ),
                                      Icon(
                                        Icons.push_pin,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ],
                                  );
                                }
                                return const Icon(
                                  Icons.location_on,
                                  color: Colors.blue,
                                  size: 30,
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _zoomIn();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 8,
                            primary: const Color.fromARGB(255, 36, 34, 34),
                            shape: const CircleBorder(),
                            minimumSize: const Size(35, 35),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _zoomOut();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 8,
                            primary: const Color.fromARGB(255, 36, 34, 34),
                            shape: const CircleBorder(),
                            minimumSize: const Size(35, 35),
                          ),
                          child: const Icon(
                            Icons.remove,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is CoordinatesError) {
            return CustomErrorView(
              failure: state.failure,
              retry: () {
                BlocProvider.of<MapcoordinatesBloc>(context)
                    .add(GetMapCoodinates());
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
