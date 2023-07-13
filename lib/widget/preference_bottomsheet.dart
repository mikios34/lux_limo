import 'package:beyride/api/preference/query.dart';
import 'package:beyride/controller/bottomsheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class VehiclePrefernceBottomsheet extends StatelessWidget {
  VehiclePrefernceBottomsheet({
    super.key,
  });
  final List<String> prefernnces = const ["Temprature", "Play", "Bag", "Drink"];
  final BottomSheetController bottomSheetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Preference',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 25,
                    letterSpacing: 0.4,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      onTap: () {
                        bottomSheetController.temp = null;
                        bottomSheetController.play = null;
                        bottomSheetController.bag = null;
                        bottomSheetController.drink = null;
                        bottomSheetController.currentIndex = 0;
                      },
                      child: const Icon(
                        Icons.clear,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(),
          const SizedBox(
            height: 10,
          ),
          Query(
              options:
                  QueryOptions(document: gql(getReservationPreferenceQuery)),
              builder: (result, {fetchMore, refetch}) {
                if (result.isLoading) {
                  return const Padding(
                    padding: const EdgeInsets.all(38.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                if (result.hasException) {
                  return Center(
                    child: Text("Error is ${result.exception}"),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.only(left: 60.0),
                            child: Divider(),
                          ),
                      itemBuilder: (context, index) => MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              bottomSheetController.currentIndex = index + 3;
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 54.0,
                                  height: 54.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColorDark,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: Icon(
                                        index == 0
                                            ? Icons.water
                                            : index == 1
                                                ? Icons.music_note
                                                : index == 2
                                                    ? Icons.shopping_bag_rounded
                                                    : Icons.storefront_rounded,
                                        color: Colors.black,
                                      )),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Obx(() {
                                  return Text(
                                    index == 0
                                        ? bottomSheetController.temp ??
                                            prefernnces[index]
                                        : index == 1
                                            ? bottomSheetController.play ??
                                                prefernnces[index]
                                            : index == 2
                                                ? bottomSheetController.bag ??
                                                    prefernnces[index]
                                                : bottomSheetController.drink ??
                                                    prefernnces[index],
                                    style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 15,
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w400),
                                  );
                                }),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                )
                              ],
                            ),
                          ),
                      itemCount: 4),
                );
              }),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
                onPressed: () {
                  bottomSheetController.currentIndex = 2;
                },
                child: Text("Set Preference")),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  bottomSheetController.temp = null;
                  bottomSheetController.play = null;
                  bottomSheetController.bag = null;
                  bottomSheetController.drink = null;
                  bottomSheetController.currentIndex = 2;
                },
                child: Text("Skip")),
          ),
        ],
      ),
    );
  }
}
