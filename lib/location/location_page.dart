import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      fullscreenDialog: false,
      builder: (context) => const LocationPage(),
    );
  }

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late GoogleMapController mapController;
  final Location _location = Location();
  final LatLng _initialcameraposition = const LatLng(45.521563, -122.677433);
  StreamSubscription? _subscription;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _subscription = _location.onLocationChanged.listen((l) {
      debugPrint('Listening...');
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(l.latitude ?? _initialcameraposition.latitude,
              l.longitude ?? _initialcameraposition.longitude),
          zoom: 15.0)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my_location').tr(),
        backgroundColor: Colors.green[700],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition, zoom: 11.0),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    _subscription?.cancel();
    super.dispose();
  }
}
