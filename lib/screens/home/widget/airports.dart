import 'package:beyride/api/query.dart';
import 'package:beyride/model/airport.dart';
import 'package:beyride/model/place_detail.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AirPorts extends StatelessWidget {
  AirPorts({super.key});

  final HomePageController homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Airports",
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Query(
              options: QueryOptions(document: gql(getReservationAirport)),
              builder: (result, {fetchMore, refetch}) {
                if (result.isLoading) {
                  return const CircularProgressIndicator(
                    color: Colors.black,
                  );
                }
                if (result.hasException) {
                  refetch!();
                  return Text("Error ${result.exception}");
                }
                final List<Airport> airports =
                    (result.data!['getReservationAirport'] as List)
                        .map((e) => Airport.fromJson(e))
                        .toList();
                return GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: airports.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 22,
                      childAspectRatio: 1,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) =>
                      _buildAirportItem(context, airports[index]),
                );
              })
        ],
      ),
    );
  }

  Widget _buildAirportItem(BuildContext context, Airport airport) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.circular(3)),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 17),
            onPressed: () {
              homePageController.destination = PlaceDetail(
                  placeName: airport.address,
                  placeId: airport.name,
                  lat: airport.latitude,
                  lng: airport.longitude);
              if (!homePageController.showSearchPanel) {
                homePageController.showSearchPanel = true;
              }
              homePageController.destinationTextEditingController.text =
                  airport.address;
              homePageController.pickupFocusNode.requestFocus();
            },
            child: const Icon(
              Icons.airplanemode_active,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          airport.name,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.8,
          ),
        )
      ],
    );
  }
}
