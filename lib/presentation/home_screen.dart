import 'package:angleswing_skill_assesment/constants/url_info.dart';
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
  double currentZoom = 13.0;
  MapController mapController = MapController();
  LatLng currentCenter = LatLng(51.5, -0.09);

  void _zoom() {
    currentZoom = currentZoom - 1;
    mapController.move(currentCenter, currentZoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              _zoom();
            },
            child: const Icon(Icons.navigation),
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: const Text("Angleswing Demo"),
      // ),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
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
    );
  }
}
