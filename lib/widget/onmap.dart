import 'package:beyride/constant.dart';
import 'package:beyride/controller/map_controller.dart';
import 'package:beyride/controller/place_controller.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OnMapWidget extends StatefulWidget {
  OnMapWidget({super.key, required});

  @override
  State<OnMapWidget> createState() => _OnMapWidgetState();
}

class _OnMapWidgetState extends State<OnMapWidget> {
  FocusNode pickupLocationNode = FocusNode();

  final pickupController = TextEditingController();

  FocusNode droppOffLocationNode = FocusNode();

  final droppOffController = TextEditingController();

  MapController mapController = Get.find();

  @override
  Widget build(BuildContext context) {
    PlaceController placeController = Get.put(PlaceController());
    print(mapController.locationMarkers);
    return Container(
      // height: 250,
      width: double.infinity,
      // color: Colors.white,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<PlaceController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: kToolbarHeight,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          // color: Colors.blue.shade600,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          // height: 40,
                          child: TextFormField(
                            style: inputTextStyle,
                            onChanged: (value) {
                              placeController.searchPlace(value);

                              // findPlace(value);
                            },
                            // style: GoogleFonts.inter(fontSize: 13),
                            focusNode: pickupLocationNode,
                            controller: pickupController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      pickupController.clear();
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                      size: 15,
                                    )),
                                hintText: "Pickup Address",
                                // prefixIcon: const Padding(
                                //   padding: EdgeInsets.only(left: 20, right: 10),
                                //   child: Icon(
                                //     Icons.location_on,
                                //     color: Colors.blue,
                                //   ),
                                // ),
                                // fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(
                                  FeatherIcons.mapPin,
                                  size: 18,
                                  // color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 60, bottom: 5, top: 5),
                  child: SizedBox(
                    height: 10,
                    child: VerticalDivider(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(48, 0, 30, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const Icon(Icons.location_on, color: Colors.green),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          // height: 40,
                          child: TextFormField(
                            style: GoogleFonts.inter(fontSize: 13),
                            onChanged: (value) {
                              placeController.searchPlace(value);
                            },
                            maxLines: 1,
                            focusNode: droppOffLocationNode,
                            controller: droppOffController,
                            decoration: InputDecoration(
                                // isDense: true,
                                contentPadding: EdgeInsets.only(left: 15),
                                // contentPadding:
                                //     EdgeInsets.symmetric(vertical: 40.0),
                                prefixIcon: const Icon(
                                  FeatherIcons.mapPin,
                                  size: 18,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      droppOffController.clear();
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                      size: 15,
                                    )),
                                hintText: "DroppOff Address",
                                // prefixIcon: const Padding(
                                //   padding: EdgeInsets.only(left: 20, right: 10),
                                //   child: Icon(
                                //     Icons.location_on,
                                //     color: Colors.blue,
                                //   ),
                                // ),
                                // fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
          Obx(() {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.only(top: 00, bottom: 10),
                // height: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                constraints: const BoxConstraints(maxHeight: 300, minHeight: 0),
                width: double.infinity,
                child: placeController.loading.value
                    ? const Center(
                        child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            )),
                      )
                    : ListView.separated(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Material(
                            color: Colors.white,
                            child: ListTile(
                              minVerticalPadding: 0,
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              onTap: () {
                                print("object GGGGGGGGGGGGGGGGGG");
                                if (droppOffLocationNode.hasFocus) {
                                  settingDropOffDialog(context);

                                  placeController
                                      .getPlaceDetailByPlaceId(
                                          placeController.places[index].placeId)
                                      .then((value) {
                                    placeController.setDroppOffLocation(value);
                                    droppOffController.text =
                                        placeController.places[index].mainText;
                                    placeController.places.clear();

                                    mapController.addMarker(
                                        LatLng(value.lat, value.lng), false);
                                    if (placeController.pickupLoaction !=
                                        null) {
                                      placeController
                                          .getDirection()
                                          .then((value) {
                                        mapController
                                            .getPolyline(value.encodedPoints);
                                      });
                                      mapController.gMController.animateCamera(
                                          CameraUpdate.newLatLngBounds(
                                              boundsFromLatLngList([
                                                LatLng(
                                                    placeController
                                                        .droppOffLocation!.lat,
                                                    placeController
                                                        .droppOffLocation!.lng),
                                                LatLng(
                                                    placeController
                                                        .pickupLoaction!.lat,
                                                    placeController
                                                        .pickupLoaction!.lng)
                                              ]),
                                              100));
                                    }

                                    Navigator.pop(context);
                                  });
                                } else if (pickupLocationNode.hasFocus) {
                                  print("tap tap");

                                  settingPickupDialog(context);

                                  placeController
                                      .getPlaceDetailByPlaceId(
                                          placeController.places[index].placeId)
                                      .then((value) {
                                    placeController.setPickupLocation(value);
                                    pickupController.text =
                                        placeController.places[index].mainText;
                                    pickupLocationNode.nextFocus();

                                    placeController.places.clear();
                                    mapController.addMarker(
                                        LatLng(value.lat, value.lng), true);
                                    if (placeController.droppOffLocation !=
                                        null) {
                                      placeController
                                          .getDirection()
                                          .then((value) {
                                        mapController
                                            .getPolyline(value.encodedPoints);
                                      });
                                      mapController.gMController.animateCamera(
                                          CameraUpdate.newLatLngBounds(
                                              boundsFromLatLngList([
                                                LatLng(
                                                    placeController
                                                        .droppOffLocation!.lat,
                                                    placeController
                                                        .droppOffLocation!.lng),
                                                LatLng(
                                                    placeController
                                                        .pickupLoaction!.lat,
                                                    placeController
                                                        .pickupLoaction!.lng)
                                              ]),
                                              100));
                                    }

                                    Navigator.pop(context);
                                  });
                                }
                              },
                              leading: const Icon(
                                Icons.location_on,
                                color: Colors.black,
                                size: 20,
                              ),
                              title: Text(
                                  placeController.places[index].mainText,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.black)),
                            ),
                          ); //_buildPredictedItem(state.placeList[index]);
                        },
                        separatorBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(color: Colors.black38),
                            ),
                        itemCount: placeController.places.length),
              ),
            );
          }),
        ],
      ),
    );
  }

  void settingDropOffDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext cont) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Text("Setting Dropp Off location."),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void settingPickupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext cont) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Text("Setting pickup location."),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

LatLngBounds boundsFromLatLngList(List<LatLng> list) {
  assert(list.isNotEmpty);
  double? x0, x1, y0, y1;
  for (LatLng latLng in list) {
    if (x0 == null) {
      x0 = x1 = latLng.latitude;
      y0 = y1 = latLng.longitude;
    } else {
      if (latLng.latitude > x1!) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > y1!) y1 = latLng.longitude;
      if (latLng.longitude < y0!) y0 = latLng.longitude;
    }
  }

  return LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
}
