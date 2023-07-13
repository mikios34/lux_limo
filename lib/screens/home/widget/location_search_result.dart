import 'package:beyride/api/address/query.dart';
import 'package:beyride/controller/place_controller.dart';
import 'package:beyride/model/address/address_model.dart';
import 'package:beyride/model/place.dart';
import 'package:beyride/model/place_detail.dart';
import 'package:beyride/screens/address/widget/address_item.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:beyride/util/loading_progress_indicator.dart';
import 'package:beyride/screens/vehicle_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LocationSearchResult extends StatelessWidget {
  LocationSearchResult({super.key});
  final PlaceController placeController = Get.find();
  final HomePageController homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (placeController.loading.value) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      }
      if (placeController.places.isEmpty) {
        return Query(
          options: QueryOptions(
            document: gql(getReservationUserAddressQuery),
            variables: {
              'userId': GetStorage().read('uid')
            }, // Replace with the desired user ID
          ),
          builder: (result, {fetchMore, refetch}) {
            if (result.hasException == true) {
              print("result ${result.exception}");
              return const Text('Error fetching addresses');
            }
            // if (result.isLoading == true) {
            //   return const CircularProgressIndicator(
            //     color: Colors.black,
            //   );
            // }

            final data = result.data;
            final List<dynamic> addressList =
                data?['getReservationUserAddress'] ?? [];

            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final addressData = addressList[index];
                final address = Address(
                  id: addressData['id'],
                  address: addressData['address'],
                  latitude: addressData['latitude'],
                  longitude: addressData['longitude'],
                  type: addressData['type'],
                );
                return ListTile(
                  onTap: () {
                    _handleOnTap(PlaceDetail(
                        placeName: address.address!,
                        placeId: address.address!,
                        lat: address.latitude!,
                        lng: address.longitude!));
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  leading: Icon(
                    address.type == "Home"
                        ? Icons.home
                        : address.type == "Work"
                            ? Icons.work
                            : Icons.location_pin,
                    color: Colors.black,
                    size: 30,
                  ),
                  title: Text(
                    address.address!,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    address.address!.split(',').last,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.4,
                      color: Colors.black,
                    ),
                  ),
                );
              },
              itemCount: addressList.length,
            );
          },
        );
      }
      return ListView.separated(
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => ListTile(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) => const LoadinProgressIndicator());
                  final place = await placeController.getPlaceDetailByPlaceId(
                      placeController.places[index].placeId);
                  Navigator.pop(context);
                  _handleOnTap(place);

                  // Navigator.pop(context);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                title: Text(
                  "${placeController.places[index].mainText} ${placeController.places[index].secondaryText}",
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
          itemCount: placeController.places.length);
    });
    // ListView.builder(
    // itemBuilder: (context, index) => const Text("TTTTTTTTTTTTTTT"),
    // );
  }

  void _navigateToNextPage() {
    Get.to(() => VehicleCategory());
  }

  void _handleOnTap(PlaceDetail place) {
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        if (homePageController.pickupFocusNode.hasFocus) {
          homePageController.pickup = place;
          homePageController.pickupTextEditingController.text = place.placeName;
          if (homePageController.showStopPicker &&
              homePageController.stop == null) {
            homePageController.stopFocusNode.requestFocus();
          } else if (homePageController.destination == null) {
            homePageController.destinationFocusNode.requestFocus();
          } else {
            // to next page
            _navigateToNextPage();
          }
        }
        if (homePageController.stopFocusNode.hasFocus) {
          homePageController.stop = place;
          homePageController.stopeTextEditingController.text = place.placeName;
          if (homePageController.pickup == null) {
            homePageController.pickupFocusNode.requestFocus();
          } else if (homePageController.destination == null) {
            homePageController.destinationFocusNode.requestFocus();
          } else {
            // to next page
            _navigateToNextPage();
          }
          print("Stope selected");
        }
        if (homePageController.destinationFocusNode.hasFocus) {
          homePageController.destination = place;
          homePageController.destinationTextEditingController.text =
              place.placeName;
          if (homePageController.showStopPicker &&
              homePageController.stop == null) {
            homePageController.stopFocusNode.requestFocus();
          } else if (homePageController.pickup == null) {
            homePageController.pickupFocusNode.requestFocus();
          } else {
            // to next page
            _navigateToNextPage();
          }
          print("Destination selected");
        }
      },
    );
  }
}
