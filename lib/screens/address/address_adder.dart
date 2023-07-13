import 'package:beyride/api/address/mutation.dart';
import 'package:beyride/constant.dart';
import 'package:beyride/controller/place_controller.dart';
import 'package:beyride/util/loading_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddressAdderPage extends StatelessWidget {
  final Future<QueryResult<Object?>?> Function()? refetch;

  AddressAdderPage({super.key, required this.type, required this.refetch});
  final String type;
  final PlaceController placeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(95),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 35),
            child: TextFormField(
              style: inputTextStyle,
              decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Enter Address',
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Colors.black,
                  )),
              onChanged: (value) {
                placeController.searchPlace(value);
              },
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (placeController.loading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
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

                    final client = GraphQLProvider.of(context);

                    if (place != null) {
                      final input = {
                        "user_id": GetStorage().read('uid'),
                        "address": place.placeName,
                        "latitude": place.lat,
                        "longitude": place.lng,
                        "type": type,
                      };

                      final result = await client.value.mutate(
                        MutationOptions(
                          document: gql(addReservationUserAddressMutation),
                          variables: {'input': input},
                        ),
                      );

                      if (result.hasException) {
                        Navigator.pop(context);

                        print("Exception is ${result.exception}");

                        Fluttertoast.showToast(
                          msg: 'Please try again',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      } else {
                        if (refetch != null) {
                          refetch!();
                        }
                        Navigator.pop(context);
                        Get.back();
                      }
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  title: Text(
                    placeController.places[index].secondaryText,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.2,
                        color: Colors.black),
                  ),
                  subtitle: Text(
                    placeController.places[index].mainText,
                    style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.2,
                        color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.add,
                    color: Colors.black,
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

        // ListView.builder(
        // itemBuilder: (context, index) => const Text("TTTTTTTTTTTTTTT"),
        // );
      }),
    );
  }
}
