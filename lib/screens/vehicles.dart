import 'package:beyride/api/vehicle/mutation.dart';
import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:beyride/util/loading_progress_indicator.dart';
import 'package:beyride/screens/saved_vehicles.dart';
import 'package:beyride/widget/date_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Vehicles extends StatelessWidget {
  // PlaceController placeController = Get.find();
  final List<List<VehicleMake>> vehicles;
  final List<String> categories;
  final String currentCat;
  final Future<QueryResult<Object?>?> Function()? refetch;
  Vehicles({
    super.key,
    required this.vehicles,
    required this.categories,
    required this.currentCat,
    required this.refetch,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      initialIndex: categories.indexWhere((element) => element == currentCat),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 70,
          // title: Text(
          //   "Select Vehicle",
          //   style: GoogleFonts.inter(
          //     fontWeight: FontWeight.w500,
          //     fontSize: 20,
          //     color: Colors.black,
          //   ),
          // ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Get.to(() => SavedVehicles(
                        catvehicles: vehicles,
                      ));
                },
                icon: Icon(Icons.favorite_outline))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: SizedBox(
              width: double.infinity,
              child: TabBar(
                  isScrollable: true,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  labelColor: Colors.black,
                  labelPadding: EdgeInsets.only(right: 15),
                  indicatorPadding: EdgeInsets.only(right: 30),
                  indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide(
                        width: 2,
                        color: Colors
                            .black), // Customize the indicator color and width
                    // insets: EdgeInsets.only(
                    //     left: 10,
                    //     right: 10,
                    //     bottom: 0), // Adjust the insets for width and alignment
                  ),
                  // indicator: UnderlineTabIndicator(
                  //     borderRadius: BorderRadius.circular(3),
                  //     borderSide: BorderSide(width: 4, color: Colors.black)),
                  labelStyle: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: 0.6,
                  ),
                  unselectedLabelStyle: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    letterSpacing: 0.6,
                  ),
                  tabs: List.generate(
                      categories.length,
                      (index) => Tab(
                            text: categories[index],
                          ))),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
              children: List.generate(
            vehicles.length,
            (index) => ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, newind) {
                return _buildVehicleCard(vehicles[index][newind], context);
              },
              itemCount: vehicles[index].length,
            ),
          )

              // [
              //   ListView.builder(
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) {
              //       return _buildVehicleCard(vehicles[index], context);
              //     },
              //     itemCount: vehicles.length,
              //   ),
              // ],
              ),
        ),
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
              child: Mutation(
                  options: MutationOptions(
                      onCompleted: (data) {
                        print("Dataaaaaaaaaaaaaaaaa $data");
                        Navigator.pop(context);
                        if (data != null) {
                          refetch!();
                        }
                      },
                      onError: (error) {
                        Fluttertoast.showToast(msg: "Please try again!");
                      },
                      document: gql(saveReservationVehicleMutation)),
                  builder: (runMutation, result) {
                    return IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => LoadinProgressIndicator(),
                          );
                          runMutation({
                            "userId": GetStorage().read('uid'),
                            "vehicleId": vehicle.vehicleMakeId
                          });
                        },
                        icon: vehicle.isSaved!
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_outline));
                  }))
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