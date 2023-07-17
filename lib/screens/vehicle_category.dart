import 'package:beyride/api/vehicle/query.dart';
import 'package:beyride/controller/bottomsheet_controller.dart';
import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:beyride/screens/saved_vehicles.dart';
import 'package:beyride/screens/search_vehicle.dart';
import 'package:beyride/screens/vehicles.dart';
import 'package:beyride/util/error_page.dart';
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
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class VehicleCategory extends StatefulWidget {
  const VehicleCategory({super.key});

  @override
  State<VehicleCategory> createState() => _VehicleCategoryState();
}

class _VehicleCategoryState extends State<VehicleCategory> {
  // final image =
  late List<VehicleMake> vehicles = [];
  final homePageController = Get.put(HomePageController());

  // int currentIndex = 0;
  final bottomSheetController = Get.put(BottomSheetController());

  @override
  Widget build(BuildContext context) {
    // int currentIndex = 0;

    return WillPopScope(
      onWillPop: () async {
        homePageController.resetHomePage();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.white,
          // title: Text(
          //   "Select Vehicle",
          //   style: GoogleFonts.inter(
          //       color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          // ),
          leading: IconButton(
              onPressed: () {
                homePageController.resetHomePage();

                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const SearchVehicle());
                },
                icon: const Icon(
                  FeatherIcons.search,
                  color: Colors.black,
                  size: 18,
                )),
            IconButton(
                onPressed: () {
                  Get.to(() => const SavedVehicles());
                },
                icon: const Icon(
                  FeatherIcons.heart,
                  size: 18,
                ))
          ],
        ),
        body: Query(
            options: QueryOptions(
                document: gql(getVehicleList),
                variables: {"user_id": GetStorage().read('uid')}),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }

              if (result.hasException) {
                return ErrorPage(refetch: refetch);
              }
              final fromvehicles = (result.data!['getVehicleList'] as List)
                  .map((e) => VehicleMake.fromJson(e))
                  .toList();
              final hightlyRatedV = fromvehicles
                  .where((element) => element.isHighlyRated == true)
                  .toList();
              final modified = hightlyRatedV
                  .map((e) => e.copyWith(vehicleMake: "Highly Rated"))
                  .toList();
              // vehicles.addAll(modified);
              vehicles = [...modified, ...fromvehicles];

              final cats = categorizeVehicles(vehicles).keys.toList();
              final catV = categorizeVehicles(vehicles).values.toList();
              return ListView(
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
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5.0),
            child: TextButton(
              onPressed: () {
                Get.to(() => Vehicles(
                      categories: categories,
                      currentCat: category,
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
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
                        const TempratureBottomSheet(),
                        const PlayBottomSheet(),
                        const BagBottomSheet(),
                        const DrinkBottomsheet()
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
                          return Obx(() {
                            return bottomSheets[
                                bottomSheetController.currentIndex];
                          });
                        },
                      ).then((value) {});
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              letterSpacing: 1.2,
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "Up to ${vehicles[index].vehicleCapacity} seats",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              letterSpacing: 0.6,
                              fontSize: 9,
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
