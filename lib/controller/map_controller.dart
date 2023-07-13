import 'package:beyride/model/direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Map<MarkerId, Marker> locationMarkers = {};
  Map<PolylineId, Polyline> polylines = {};
  Map<MarkerId, Marker> carMarker = {};

  late GoogleMapController gMController;

  PolylinePoints polylinePoints = PolylinePoints();

  List<LatLng> polylineCoordinates = [];

  addMarker(LatLng location, isPickup) {
    // for (int i = 0; i < locations.length; i++) {
    MarkerId markerId = MarkerId(isPickup ? "p" : "d");
    Marker marker = Marker(
      markerId: markerId,
      icon: BitmapDescriptor.defaultMarkerWithHue(
          isPickup ? BitmapDescriptor.hueBlue : BitmapDescriptor.hueRed),
      position: location,
    );
    locationMarkers[markerId] = marker;
    // }

    update();
  }

  getPolyline(String encodedString) {
    polylineCoordinates.clear();
    List<PointLatLng> result = polylinePoints.decodePolyline(encodedString);

    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  _addPolyLine() {
    polylines.clear();
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        width: 4,
        polylineId: id,
        jointType: JointType.round,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        color: const Color.fromRGBO(46, 99, 132, 1),
        geodesic: true,
        points: polylineCoordinates);

    polylines[id] = polyline;
    update();

    //Future.delayed(Duration(seconds: 1), () {});
  }
}
