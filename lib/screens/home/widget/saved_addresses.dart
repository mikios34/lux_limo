import 'package:beyride/model/address/address_model.dart';
import 'package:beyride/model/place_detail.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedAddresses extends StatelessWidget {
  SavedAddresses({super.key, required this.addresses});
  final List<Address> addresses;

  final HomePageController homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Addresses",
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
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                    leading: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        addresses[index].type == "Home"
                            ? Icons.home
                            : addresses[index].type == "Work"
                                ? Icons.work
                                : Icons.location_pin,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),

                    onTap: () {
                      homePageController.destination = PlaceDetail(
                          placeName: addresses[index].address!,
                          placeId: addresses[index].address!,
                          lat: addresses[index].latitude!,
                          lng: addresses[index].longitude!);
                      if (!homePageController.showSearchPanel) {
                        homePageController.showSearchPanel = true;
                      }
                      homePageController.destinationTextEditingController.text =
                          addresses[index].address!;
                      homePageController.pickupFocusNode.requestFocus();
                    },
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      addresses[index].address!,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.4,
                        color: Colors.black,
                      ),
                    ),
                    // subtitle: Text(
                    //   addresses[index].address!.split(',').last,
                    //   style: GoogleFonts.inter(
                    //     fontSize: 10,
                    //     fontWeight: FontWeight.w300,
                    //     letterSpacing: 1.4,
                    //     color: Colors.black,
                    //   ),
                    // ),
                  ),
              separatorBuilder: (context, index) => Container(
                    padding: const EdgeInsets.only(left: 50),
                    child: const Divider(),
                  ),
              itemCount: addresses.length)
        ],
      ),
    );
  }
}
