import 'dart:convert';
import 'package:beyride/constant.dart';
import 'package:beyride/model/direction.dart';
import 'package:beyride/model/place.dart';
import 'package:beyride/model/place_detail.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class PlaceDataProvider {
  static http.Client httpClient = http.Client();
  PlaceDataProvider();
  Future<List<Place>> predictLocation(String location) async {
    final _baseUrl =
        // "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$location&location=37.0902%2C95.7129&radius=500&types=(establishment|address)&key=$googleMapApiKey";

    "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$location&location=37.0902%2C95.7129&radius=500&types=address&key=$googleMapApiKey";

    final response = await httpClient.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List places = data["predictions"];
      return places.map((e) => Place.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load loaction');
    }
  }

  Future<PlaceDetail> getPlaceAddressDetails(String placeId) async {
    final _placeDetailUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$googleMapApiKey";

    final response = await httpClient.get(Uri.parse(_placeDetailUrl));
    // print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return PlaceDetail.fromJson(data);
    } else {
      throw Exception('Failed to load loaction');
    }
  }

  Future<Direction> getDirectionFromDifrentPickupLocation(
      LatLng pickupLocation, LatLng destination) async {
    final _directionUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${pickupLocation.latitude},${pickupLocation.longitude}&destination=${destination.latitude},${destination.longitude}&key=$googleMapApiKey";

    final response = await httpClient.get(Uri.parse(_directionUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Direction.fromJson(data);
    } else {
      throw Exception('Failed to load loaction');
    }
  }
}



// https://maps.googleapis.com/maps/api/distancematrix/json?destinations=9.088409535687633,38.73075660130633|9.188409535687633,38.23075660130633&origins=9.072051804533025%2C38.774186931684575&key=AIzaSyBFKZsbNXUziq9csKo43sluvfjAxwtBbx8
