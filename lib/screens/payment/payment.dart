import 'package:beyride/api/address/query.dart';
import 'package:beyride/dumy/cards.dart';
import 'package:beyride/model/card/card_model.dart';
import 'package:beyride/screens/payment/card_adder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'widget/card_item.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});
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
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
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
                    return Text('Error fetching addresses');
                  }

                  if (result.isLoading == true) {
                    return const CircularProgressIndicator(
                      color: Colors.black,
                    );
                  }

                  final data = result.data;
                  final List<dynamic> cardsList =
                      data?['getReservationUserAddress'] ?? [];

                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // final cardData = cardsList[index];
                      // final card = CardModel.fromJson(cardData);
                      return CardItem(
                        card: dummyCards[index],
                        refetch: refetch,
                      );
                    },
                    itemCount: dummyCards.length,
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
                      Get.to(() => const CardAdderPage());
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add, color: Colors.black),
                        Text(
                          "Add Payment",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.06,
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
