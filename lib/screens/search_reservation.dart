import 'package:beyride/api/reservation/query.dart';
import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:beyride/screens/vehicle/widget/vehicle_card.dart';
import 'package:beyride/util/error_page.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SearchResrvation extends StatefulWidget {
  const SearchResrvation({
    super.key,
  });

  @override
  State<SearchResrvation> createState() => _SearchResrvationState();
}

class _SearchResrvationState extends State<SearchResrvation> {
  String keyword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: Text(
          "Search ",
          style: GoogleFonts.inter(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                keyword = value;
                setState(() {});
                // if (homeSearchController.selectedMenu.value == "Order") {
                //   searchController.changeKeyword((int.parse(value)));
                // } else {
                //   searchproductController.changeKeyword(value);
                // }
              },
              autofocus: true,
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
                        // _serchController.clear();
                      },
                      icon: const Icon(
                        FeatherIcons.x,
                        color: Colors.grey,
                        size: 15,
                      )),
                  // hintText: homeSearchController.selectedMenu.value == 'Order'
                  //     ? "${"Search by Order # ...".tr}"
                  //     : "${"Search Product ...".tr}",
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
      body: Query(
        options: QueryOptions(
            document: gql(searchReservationVehicleQuery),
            variables: {"vehicleModel": keyword}),
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
          return ListView.separated(
              itemBuilder: (context, index) =>
                  VehicleCard(vehicle: vehicles[index], refetch: refetch),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: vehicles.length);
        },
      ),
    );
  }
}
