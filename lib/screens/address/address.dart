import 'package:beyride/api/address/query.dart';
import 'package:beyride/model/address/address_model.dart';
import 'package:beyride/screens/address/widget/address_item.dart';
import 'package:beyride/util/error_page.dart';
import 'package:beyride/widget/add_address_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddressesPage extends StatelessWidget {
  AddressesPage({super.key});
  late Future<QueryResult<Object?>?> Function()? refetch;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(
                "Add Address for QUICKER reservation",
                style: GoogleFonts.inter(
                    fontSize: 23,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.4),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              constraints: BoxConstraints(maxHeight: height * 55),
              child: Query(
                options: QueryOptions(
                  document: gql(getReservationUserAddressQuery),
                  variables: {
                    'userId': GetStorage().read('uid')
                  }, // Replace with the desired user ID
                ),
                builder: (result, {fetchMore, refetch}) {
                  this.refetch = refetch;
                  if (result.hasException == true) {
                    print("result ${result.exception}");
                    return ErrorPage(refetch: refetch);
                  }

                  if (result.isLoading == true) {
                    return const CircularProgressIndicator(
                      color: Colors.black,
                    );
                  }

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
                      return AddressItem(
                        address: address,
                        refetch: refetch,
                      );
                    },
                    itemCount: addressList.length,
                  );
                },
              ),
            ),

            // Container(
            //   constraints: BoxConstraints(maxHeight: height * 70),
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) => AddressItem(
            //       address: dummyAddressList[index],
            //       // refetch: refetch,
            //     ),
            //     itemCount: dummyAddressList.length,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        builder: (context) {
                          return AddAddressBottomSheet(
                            refetch: refetch,
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add, color: Colors.black),
                        Text(
                          "Add Address",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.2,
                              color: Colors.black),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
