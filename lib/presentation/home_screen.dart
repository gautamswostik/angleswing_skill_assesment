import 'package:angleswing_skill_assesment/presentation/drawer/app_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.gps_fixed),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.navigation),
          ),
        ],
      ),
    );
  }
}
