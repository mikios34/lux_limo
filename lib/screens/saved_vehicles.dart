import 'package:beyride/model/vehicle.dart';
import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:beyride/widget/date_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedVehicles extends StatelessWidget {
  // PlaceController placeController = Get.find();
  final List<List<VehicleMake>>? catvehicles;
  final List<VehicleMake>? vehicles;

  SavedVehicles({
    super.key,
    this.vehicles,
    this.catvehicles,
  });
  @override
  Widget build(BuildContext context) {
    final List<VehicleMake> flattenedList = catvehicles != null
        ? catvehicles!
            .expand((element) => element)
            .where((element) => element.isSaved == true)
            .toList()
        : vehicles!.where((element) => element.isSaved == true).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Text(
          "Saved Vehicles",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
        ),
      ),
      body: flattenedList.isEmpty
          ? const Center(
              child: Text("Empty"),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _buildVehicleCard(flattenedList[index], context);
                },
                itemCount: flattenedList.length,
              )

              // [
              //   ListView.builder(
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) {
              //       return _buildVehicleCard(SavedVehicles[index], context);
              //     },
              //     itemCount: SavedVehicles.length,
              //   ),
              // ],

              ),
    );
  }

  _buildVehicleCard(VehicleMake vehicle, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).primaryColorDark,

              ///const Color.fromRGBO(50, 45, 64, 1),
            ),
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  builder: (context) {
                    return DateBottomSheet(
                      vehicle: vehicle,
                    );
                  },
                );
                // Get.to(BookingDetail(
                //   vehicle: vehicle,
                // ));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Image(
                        height: 120, image: NetworkImage(vehicle.vehicleLogo!)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vehicle.vehicleModel!,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 0.6,
                              ),
                            ),
                            Text(
                              "Up to ${vehicle.vehicleCapacity!} Seats",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$232",
                          //( vehicle.price *
                          //       placeController.direction.distanceValue *
                          //       0.000621371)
                          //   .toStringAsFixed(2),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 0,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)))
        ],
      ),
    );
  }
}

// final shimmerGradient = LinearGradient(
//   colors: [
//     const Color(0xFFEBEBF4),
//     const Color(0xFFF4F4F4),
//     Colors.grey.shade200
//   ],
//   stops: const [
//     0.1,
//     0.3,
//     0.4,
//   ],
//   begin: const Alignment(-1.0, -0.3),
//   end: const Alignment(1.0, 0.3),
//   tileMode: TileMode.clamp,
// );

// const googleMapApiKey = 'AIzaSyBFKZsbNXUziq9csKo43sluvfjAxwtBbx8';

//   if (result.isLoading) {
//                       return Center(
//                         child: ListView.builder(
//                           itemBuilder: (context, index) {
//                             return Padding(
//                                 padding: const EdgeInsets.only(top: 25),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Colors.grey, width: 0.2),
//                                     borderRadius: BorderRadius.circular(6),
//                                     // color: const Color.fromRGBO(50, 45, 64, 1),
//                                   ),
//                                   width: double.infinity,
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 20, horizontal: 10),
//                                     child: Column(
//                                       children: [
//                                         Shimmer(
//                                           gradient: shimmerGradient,
//                                           child: Container(
//                                             height: 90,
//                                             width: double.infinity,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               color: Colors.grey.shade200,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Shimmer(
//                                                   gradient: shimmerGradient,
//                                                   child: Container(
//                                                     height: 10,
//                                                     width: 180,
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10),
//                                                       color:
//                                                           Colors.grey.shade200,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 15,
//                                                 ),
//                                                 Shimmer(
//                                                   gradient: shimmerGradient,
//                                                   child: Container(
//                                                     height: 10,
//                                                     width: 120,
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10),
//                                                       color:
//                                                           Colors.grey.shade200,
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             Shimmer(
//                                               gradient: shimmerGradient,
//                                               child: Container(
//                                                 height: 10,
//                                                 width: 60,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(10),
//                                                   color: Colors.grey.shade200,
//                                                 ),
//                                               ),
//                                             )
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ));
//                           },
//                         ),
//                       );
//                     }