import 'package:beyride/model/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  late num minDistance;
  late num maxDistance;
  late List<String> supportedAreas;
  late FocusNode pickupFocusNode;
  late FocusNode stopFocusNode;
  late FocusNode destinationFocusNode;
  late String privacyUrl;
  late String contactPhone;
  late String contactEmail;
  late String aboutUrl;

  final _date = Rxn<DateTime>();
  final _time = Rxn<TimeOfDay>();

  DateTime? get date => _date.value;
  set date(DateTime? date) => _date.value = date;

  TimeOfDay? get time => _time.value;
  set time(TimeOfDay? time) => _time.value = time;

  final pickupTextEditingController = TextEditingController();
  final stopeTextEditingController = TextEditingController();
  final destinationTextEditingController = TextEditingController();

  final _pickup = Rxn<PlaceDetail>();

  PlaceDetail? get pickup => _pickup.value;
  set pickup(PlaceDetail? place) => _pickup.value = place;

  final _destination = Rxn<PlaceDetail>();

  PlaceDetail? get destination => _destination.value;
  set destination(PlaceDetail? place) => _destination.value = place;

  final _stop = Rxn<PlaceDetail>();

  PlaceDetail? get stop => _stop.value;
  set stop(PlaceDetail? place) => _stop.value = place;

  final _showStopPicker = false.obs;

  bool get showStopPicker => _showStopPicker.value;
  set showStopPicker(bool value) => _showStopPicker.value = value;

  final _showSearchPanel = false.obs;

  bool get showSearchPanel => _showSearchPanel.value;
  set showSearchPanel(bool value) => _showSearchPanel.value = value;

  void handleFocusChange(FocusNode focusNode) {
    if (!showSearchPanel) {
      showSearchPanel = true;
    }

    // Perform actions based on the focus state of the text fields
    if (pickupFocusNode.hasFocus ||
        stopFocusNode.hasFocus ||
        destinationFocusNode.hasFocus) {
      // One of the text fields is focused
      // Perform your desired action here
    } else {
      // None of the text fields are focused
      // Perform your desired action here
    }
  }

  void resetHomePage() {
    showSearchPanel = false;
    pickup = null;
    destination = null;
    pickupTextEditingController.clear();
    stopeTextEditingController.clear();

    destinationTextEditingController.clear();

    stop = null;
  }
}
