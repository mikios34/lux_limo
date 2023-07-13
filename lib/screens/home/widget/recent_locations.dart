import 'package:beyride/model/place_detail.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentLocations extends StatelessWidget {
  RecentLocations({super.key, required this.locations});
  final List<dynamic> locations;

  final HomePageController homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent",
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
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      homePageController.destination = PlaceDetail(
                          placeName: locations[index]['dropoff'],
                          placeId: locations[index]['dropoff'],
                          lat: locations[index]['dropoff_latitude'],
                          lng: locations[index]['dropoff_longitude']);
                      if (!homePageController.showSearchPanel) {
                        homePageController.showSearchPanel = true;
                      }
                      homePageController.destinationTextEditingController.text =
                          locations[index]['dropoff'];
                      homePageController.pickupFocusNode.requestFocus();
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    title: Text(
                      locations[index]['dropoff'],
                      style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.2,
                          color: Colors.black),
                    ),
                    leading: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        shape: BoxShape.circle,
                      ),
                      child: const Material(
                        color: Colors.transparent,
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => Container(
                    padding: const EdgeInsets.only(left: 50),
                    child: const Divider(),
                  ),
              itemCount: locations.length)
        ],
      ),
    );
  }
}
