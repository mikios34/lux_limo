// import 'dart:async';

// import 'package:beyride/controller/map_controller.dart';
// import 'package:beyride/controller/place_controller.dart';
// import 'package:beyride/screens/vehicle_category.dart';
// import 'package:beyride/screens/vehicles.dart';
// import 'package:beyride/widget/onmap.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class HomePage extends StatelessWidget {
//   static const CameraPosition initialCameraPosition = CameraPosition(
//     target: LatLng(36.863140, -76.015778),
//     zoom: 14.4746,
//   );
//   MapController mapController = Get.put(MapController());
//   GoogleMapController? outerController;

//   final Completer<GoogleMapController> _controller = Completer();
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height / 100;
//     final width = MediaQuery.of(context).size.width / 100;
//     return Scaffold(
//       body: Stack(
//         children: [
//           GetBuilder<MapController>(builder: (controller) {
//             return GoogleMap(
//               initialCameraPosition: initialCameraPosition,
//               padding: const EdgeInsets.only(top: 450),
//               zoomControlsEnabled: false,
//               mapType: MapType.normal,
//               myLocationButtonEnabled: false,
//               // initialCameraPosition: _addissAbaba,
//               myLocationEnabled: true,
//               polylines: Set<Polyline>.of(controller.polylines.values),
//               markers: Set<Marker>.of(controller.locationMarkers.values),
//               onMapCreated: (mcontroller) {
//                 _controller.complete(mcontroller);
//                 controller.gMController = mcontroller;
//               },
//             );
//           }),
//           Align(alignment: Alignment.topCenter, child: OnMapWidget()),
//           GetBuilder<PlaceController>(builder: (contrller) {
//             if (contrller.pickupLoaction != null &&
//                 contrller.droppOffLocation != null) {
//               return Align(
//                 alignment: Alignment.bottomCenter,
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Container(
//                     padding: EdgeInsets.only(
//                         top: height * 1.8,
//                         left: width * 20 / width,
//                         right: width * 20 / width,
//                         bottom: height * 1.8),
//                     child: SizedBox(
//                       height: height * 50 / height,
//                       child: ElevatedButton(
//                           style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all(
//                                   const Color.fromRGBO(88, 146, 183, 1))),
//                           onPressed: () {
//                             Get.to(VehicleCategory());
//                           },
//                           child: Text(
//                             "Select Vehicle",
//                             style: GoogleFonts.inter(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white),
//                           )),
//                     ),
//                   ),
//                 ),
//               );
//             } else {
//               return const SizedBox.shrink();
//             }
//           })
//         ],
//       ),
//     );
//   }
// }
