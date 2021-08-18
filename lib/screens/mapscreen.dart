import 'dart:async';

// ignore: unused_import
import 'package:day08/models/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

// ignore: must_be_immutable
class MapSample extends StatefulWidget {
  Geo userLoaction;
  MapSample({this.userLoaction});
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition initLocation;

  // ignore: unused_field
  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
    initLocation = CameraPosition(
      target: LatLng(
        double.parse(widget.userLoaction.lat),
        double.parse(widget.userLoaction.lng),
      ),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: openLocation,
          label: Text('OpenMyLocation'),
          icon: Icon(Icons.location_city)),
    );
  }

  openLocation() {
    MapsLauncher.launchCoordinates(
      double.parse(widget.userLoaction.lat),
      double.parse(widget.userLoaction.lng),
    );
  }
  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
