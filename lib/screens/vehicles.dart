import 'package:beyride/api/vehicle/query.dart';
import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:beyride/screens/saved_vehicles.dart';
import 'package:beyride/screens/search_vehicle.dart';
import 'package:beyride/util/error_page.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'vehicle/widget/vehicle_card.dart';

class Vehicles extends StatelessWidget {
  final List<String> categories;
  final String currentCat;
  const Vehicles({
    super.key,
    required this.categories,
    required this.currentCat,
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
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const SearchVehicle());
                },
                icon: const Icon(
                  FeatherIcons.search,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: SizedBox(
              width: double.infinity,
              child: TabBar(
                  isScrollable: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  labelColor: Colors.black,
                  labelPadding: const EdgeInsets.only(right: 15),
                  indicatorPadding: const EdgeInsets.only(right: 30),
                  indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: const BorderSide(width: 2, color: Colors.black),
                  ),
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: 0.6,
                  ),
                  unselectedLabelStyle: GoogleFonts.inter(
                    fontSize: 12,
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
              final vehicles = [...modified, ...fromvehicles];

              final List<List<VehicleMake>> v =
                  categorizeVehicles(vehicles).values.toList();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBarView(
                    children: List.generate(
                  v.length,
                  (index) => ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, newind) {
                      return VehicleCard(
                        vehicle: v[index][newind],
                        refetch: refetch,
                      );
                    },
                    itemCount: v[index].length,
                  ),
                )),
              );
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
}
