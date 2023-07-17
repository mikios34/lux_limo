import 'package:beyride/api/reservation/query.dart';
import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:beyride/util/error_page.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lottie/lottie.dart';

import 'vehicle/widget/vehicle_card.dart';

class SearchVehicle extends StatefulWidget {
  const SearchVehicle({
    super.key,
  });

  @override
  State<SearchVehicle> createState() => _SearchVehicleState();
}

class _SearchVehicleState extends State<SearchVehicle> {
  final _searchController = TextEditingController();
  String keyword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: const Text(
          "Search vehicle",
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              onChanged: (value) {
                keyword = value;
                setState(() {});
              },
              autofocus: true,
              controller: _searchController,
              style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              decoration: InputDecoration(
                  isDense: true, // Added this

                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 15),
                    child: Icon(
                      FeatherIcons.search,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: const Icon(
                        FeatherIcons.x,
                        color: Colors.grey,
                        size: 15,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(width: 0.3, color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(width: 0.3, color: Colors.grey))),
            ),
          ),
        ),
      ),
      body: keyword.isEmpty
          ? Lottie.asset("assets/lottie/searching.json")
          : Query(
              options: QueryOptions(
                  fetchPolicy: FetchPolicy.cacheAndNetwork,
                  document: gql(searchReservationVehicleQuery),
                  variables: {
                    "vehicleModel": keyword,
                    "userId": GetStorage().read('uid')
                  }),
              builder: (result, {fetchMore, refetch}) {
                if (result.isLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
                }
                if (result.hasException) {
                                return ErrorPage(refetch: refetch);

                }

                final List<VehicleMake> vehicles =
                    (result.data!['searchReservationVehicle'] as List)
                        .map((e) => VehicleMake.fromJson(e))
                        .toList();
                if (vehicles.isEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        height: 150,
                        // width: 200,
                        child: Lottie.asset(
                          "assets/lottie/empty_search.json",
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Text(
                          "No results found for the moment".tr,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  );
                }
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) =>
                        VehicleCard(vehicle: vehicles[index], refetch: refetch),
                    itemCount: vehicles.length);
              },
            ),
    );
  }
}
