import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    required this.name,
    required this.lat,
    required this.long,
  });

  final String name;
  final double lat;
  final double long;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setLocation());
  }

  Future<void> setLocation() async {
    _controller.future.then(
      (value) => value.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(widget.lat, widget.long),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF0000),
        title: Text(widget.name),
      ),
      body: GoogleMap(
        initialCameraPosition: initialLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
