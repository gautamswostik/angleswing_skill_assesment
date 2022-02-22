import 'package:angleswing_skill_assesment/application/core/service/api_endpoints.dart';
import 'package:angleswing_skill_assesment/presentation/drawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      GlobalKey<ScaffoldState>();
  double currentZoom = 13.0;
  MapController mapController = MapController();
  LatLng currentCenter = LatLng(51.5, -0.09);
  bool isOpen = false;
  void _zoomOut() {
    currentZoom = currentZoom - 1;
    mapController.move(currentCenter, currentZoom);
  }

  void _zoomIn() {
    currentZoom = currentZoom + 1;
    mapController.move(currentCenter, currentZoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("MAP Demo"),
        leading: IconButton(
          onPressed: () {
            if (_drawerscaffoldkey.currentState!.isDrawerOpen) {
              Navigator.pop(context);
              setState(() {
                isOpen = false;
              });
            } else {
              _drawerscaffoldkey.currentState!.openDrawer();
              setState(() {
                isOpen = true;
              });
            }
          },
          icon: isOpen
              ? const Icon(Icons.arrow_back_ios_new)
              : const Icon(Icons.menu),
        ),
      ),

      primary: true,
      body: Scaffold(
        key: _drawerscaffoldkey,
        onDrawerChanged: ((isOpened) => setState(() {
              isOpen = isOpened;
            })),
        drawer: const AppDrawer(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 56),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.gps_fixed),
            ),
            FloatingActionButton(
              onPressed: () {
                _zoomIn();
              },
              child: const Icon(Icons.navigation),
            ),
          ],
        ),
        body: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            controller: mapController,
            center: LatLng(37.56682245821738, 126.9778163539802),
            zoom: 16,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: MapUrl.templteUrl,
              additionalOptions: {
                'accessToken': MapUrl.acceesToken,
                'id': MapUrl.id,
              },
            ),
          ],
        ),
      ),
    );
  }
}
