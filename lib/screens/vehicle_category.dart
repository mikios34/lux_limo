import 'package:beyride/api/vehicle/query.dart';
import 'package:beyride/controller/bottomsheet_controller.dart';
import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:beyride/screens/saved_vehicles.dart';
import 'package:beyride/screens/vehicles.dart';
import 'package:beyride/widget/date_bottomsheet.dart';
import 'package:beyride/widget/preference_bottomsheet.dart';
import 'package:beyride/widget/preference_bottomsheets/bag_bottomsheet.dart';
import 'package:beyride/widget/preference_bottomsheets/drink_bottomsheet.dart';
import 'package:beyride/widget/preference_bottomsheets/play_bottomsheet.dart';
import 'package:beyride/widget/preference_bottomsheets/temprature_bottomsheet.dart';
import 'package:beyride/widget/reserve_bottomsheet.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class VehicleCategory extends StatefulWidget {
  VehicleCategory({super.key});

  @override
  State<VehicleCategory> createState() => _VehicleCategoryState();
}

class _VehicleCategoryState extends State<VehicleCategory> {
  // final image =
  late List<VehicleMake> vehicles = [];

  // int currentIndex = 0;
  final bottomSheetController = Get.put(BottomSheetController());

  @override
  Widget build(BuildContext context) {
    // int currentIndex = 0;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Select Vehicle",
          style: GoogleFonts.inter(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.search,
                color: Colors.black,
                size: 18,
              )),
          IconButton(
              onPressed: () {
                Get.to(() => SavedVehicles(
                      vehicles: vehicles,
                    ));
              },
              icon: Icon(Icons.favorite_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Query(
            options: QueryOptions(
                document: gql(getVehicleList), variables: const {"user_id": 1}),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }

              if (result.hasException) {
                return Center(
                  child: Text("Error ${result.exception}"),
                );
              }
              vehicles = (result.data!['getVehicleList'] as List)
                  .map((e) => VehicleMake.fromJson(e))
                  .toList();
              final hightlyRatedV = vehicles
                  .where((element) => element.isHighlyRated == true)
                  .toList();
              final modified = hightlyRatedV
                  .map((e) => e.copyWith(vehicleMake: "Highly Rated"))
                  .toList();
              vehicles.addAll(modified);

              final cats = categorizeVehicles(vehicles).keys.toList();
              final catV = categorizeVehicles(vehicles).values.toList();
              return Column(
                  children: List.generate(
                      categorizeVehicles(vehicles).keys.length, (index) {
                return _buildVehicleCategory(
                    refetch, cats[index], catV[index], context, cats, catV);
              }));
            }),
      ),
    );
  }

  Map<String, List<VehicleMake>> categorizeVehicles(
      List<VehicleMake> vehicles) {
    Map<String, List<VehicleMake>> categorizedVehicles = {};

    // Iterate through the vehicles
    for (var vehicle in vehicles) {
      String category = vehicle.vehicleMake!;

      // Check if the category already exists in the map
      if (categorizedVehicles.containsKey(category)) {
        // If the category exists, add the vehicle to the existing category
        categorizedVehicles[category]!.add(vehicle);
      } else {
        // If the category does not exist, create a new category and add the vehicle to it
        categorizedVehicles[category] = [vehicle];
      }
    }

    return categorizedVehicles;
  }

  Widget _buildVehicleCategory(
      Future<QueryResult<Object?>?> Function()? refetch,
      String category,
      List<VehicleMake> vehicles,
      BuildContext context,
      List<String> categories,
      List<List<VehicleMake>> allVs) {
    final width = MediaQuery.of(context).size.width / 100;
    final height = MediaQuery.of(context).size.height / 100;

    return Container(
      padding: EdgeInsets.only(bottom: 15, top: 3),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
            child: TextButton(
              onPressed: () {
                Get.to(() => Vehicles(
                      vehicles: allVs,
                      categories: categories,
                      currentCat: category,
                      refetch: refetch,
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category,
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 25,
            child: ListView.builder(
              itemCount: vehicles.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: width * 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(5)),
                  child: MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    onPressed: () {
                      final List<Widget> bottomSheets = [
                        DateBottomSheet(vehicle: vehicles[index]),
                        VehiclePrefernceBottomsheet(),
                        ReservationBottomSheet(vehicle: vehicles[index]),
                        TempratureBottomSheet(),
                        PlayBottomSheet(),
                        BagBottomSheet(),
                        DrinkBottomsheet()
                      ];

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        builder: (BuildContext context) {
                          // return TempratureBottomSheet();
                          return Obx(() {
                            return bottomSheets[
                                bottomSheetController.currentIndex];
                          });
                        },
                      ).then((value) {
                        // Handle any result when the bottom sheet is dismissed
                        // if (value == 'forward') {
                        //   if (currentIndex < bottomSheets.length - 1) {
                        //     setState(() {
                        //       currentIndex++;
                        //     });
                        //   }
                        //   Future.delayed(Duration(milliseconds: 100), () {
                        //     showModalBottomSheet(
                        //       context: context,
                        //       isScrollControlled: true,
                        //       shape: const RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.only(
                        //           topLeft: Radius.circular(16.0),
                        //           topRight: Radius.circular(16.0),
                        //         ),
                        //       ),
                        //       builder: (BuildContext context) {
                        //         return bottomSheets[currentIndex];
                        //       },
                        //     );
                        //   });
                        // } else if (value == 'backward') {
                        //   print(
                        //       "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsss 444444444444444444444 $value");
                        //   if (currentIndex > 0) {
                        //     setState(() {
                        //       currentIndex--;
                        //     });
                        //   }
                        //   Future.delayed(Duration(milliseconds: 100), () {
                        //     showModalBottomSheet(
                        //       context: context,
                        //       isScrollControlled: true,
                        //       shape: const RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.only(
                        //           topLeft: Radius.circular(16.0),
                        //           topRight: Radius.circular(16.0),
                        //         ),
                        //       ),
                        //       builder: (BuildContext context) {
                        //         return bottomSheets[currentIndex];
                        //       },
                        //     );
                        //   });
                        // }
                      });
                      // showAllBottomSheet("SC", context, vehicles[index])
                      //     .then((value) {
                      //   if (value != null) {
                      //     showAllBottomSheet("PR", context, null).then((value) {
                      //       showAllBottomSheet("RD", context, vehicles[index]);
                      //     });
                      //   }
                      // });

                      // Get.to(BookingDetail(
                      //   vehicle: vehicles[index],
                      // ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "\$343",
                            // "\$${(vehicles[index].price * placeController.direction.distanceValue * 0.000621371).toStringAsFixed(0)}",
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                letterSpacing: 0.19,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: Image(
                              height: 85,
                              image:
                                  NetworkImage(vehicles[index].vehicleLogo!)),
                        ),
                        Spacer(),
                        Text(
                          vehicles[index].vehicleModel!,
                          style: GoogleFonts.inter(
                              letterSpacing: 0.6,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Up to ${vehicles[index].vehicleCapacity} seats",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              letterSpacing: 0.6,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showAllBottomSheet(
      String type, BuildContext context, VehicleMake? vehicle) async {
    final data = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return type == "PR"
            ? VehiclePrefernceBottomsheet()
            : type == "RD"
                ? ReservationBottomSheet(vehicle: vehicle!)
                : DateBottomSheet(
                    vehicle: vehicle!,
                  );
      },
    );
    return data;
  }
}
