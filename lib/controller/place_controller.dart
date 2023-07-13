import 'dart:math';

import 'package:beyride/model/direction.dart';
import 'package:beyride/model/place.dart';
import 'package:beyride/model/place_detail.dart';
import 'package:beyride/service/service.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceController extends GetxController {
  var loading = false.obs;
  var placeDeatilLoading = false.obs;
  var distanceLoading = false.obs;
  var places = <Place>[].obs;
  PlaceDetail? pickupLoaction;
  PlaceDetail? droppOffLocation;

  var placeDetail =
      const PlaceDetail(lat: 0, lng: 0, placeId: '', placeName: '').obs;
  // var selectedPlace =
  //     const Place(placeId: '', mainText: '', secondaryText: '').obs;

  // var country = ''.obs;
  // var currencyMultiplier = 0.0.obs;
  // var currencyName = ''.obs;
  // var currencies = <String>[].obs;

  late Direction direction;
  var directionLoading = false.obs;

  PlaceDataProvider placeDataProvider = PlaceDataProvider();

  void setPickupLocation(PlaceDetail placeDetail) {
    pickupLoaction = placeDetail;
    update();
  }

  void setDroppOffLocation(PlaceDetail placeDetail) {
    droppOffLocation = placeDetail;
    update();
  }

  searchPlace(String place) async {
    loading(true);
    try {
      final response = await placeDataProvider.predictLocation(place);
      places.value = response;
      loading(false);
    } catch (e) {
      loading(false);
    }
  }

  Future<PlaceDetail> getPlaceDetailByPlaceId(String placeId) async {
    placeDeatilLoading(true);
    try {
      final response = await placeDataProvider.getPlaceAddressDetails(placeId);

      placeDetail.value = response;
      loading(false);
      return response;
    } catch (e) {
      loading(false);
      throw Exception(e);
    }
  }

  Future<Direction> getDistance(
      LatLng originLatLng, LatLng destinationsLatLng) async {
    distanceLoading(true);
    try {
      final response =
          await placeDataProvider.getDirectionFromDifrentPickupLocation(
              originLatLng, destinationsLatLng);

      // placeDetail.value = response;
      // distanceLoading(false);

      return response;
    } catch (e) {
      // showErrorSnackBar(message: "Connection Error");
      distanceLoading(false);
      throw Exception(e);
    }
  }

  Future<Direction> getDirection() async {
    try {
      final directions =
          await placeDataProvider.getDirectionFromDifrentPickupLocation(
              LatLng(pickupLoaction!.lat, pickupLoaction!.lng),
              LatLng(droppOffLocation!.lat, droppOffLocation!.lng));
      direction = directions;
      return direction;
    } catch (e) {
      throw Exception(e);
    }
  }
}
