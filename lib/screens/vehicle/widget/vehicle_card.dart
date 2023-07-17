import 'package:beyride/api/vehicle/mutation.dart';
import 'package:beyride/controller/bottomsheet_controller.dart';
import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:beyride/util/loading_progress_indicator.dart';
import 'package:beyride/widget/date_bottomsheet.dart';
import 'package:beyride/widget/preference_bottomsheet.dart';
import 'package:beyride/widget/preference_bottomsheets/bag_bottomsheet.dart';
import 'package:beyride/widget/preference_bottomsheets/drink_bottomsheet.dart';
import 'package:beyride/widget/preference_bottomsheets/play_bottomsheet.dart';
import 'package:beyride/widget/preference_bottomsheets/temprature_bottomsheet.dart';
import 'package:beyride/widget/reserve_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class VehicleCard extends StatelessWidget {
  VehicleCard({
    super.key,
    required this.vehicle,
    this.refetch,
  });

  final VehicleMake vehicle;
  final Future<QueryResult<Object?>?> Function()? refetch;

  final HomePageController homePageController = Get.find();
  final BottomSheetController bottomSheetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).primaryColorDark,

              ///const Color.fromRGBO(50, 45, 64, 1),
            ),
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                final List<Widget> bottomSheets = [
                  DateBottomSheet(vehicle: vehicle),
                  VehiclePrefernceBottomsheet(),
                  ReservationBottomSheet(vehicle: vehicle),
                  const TempratureBottomSheet(),
                  const PlayBottomSheet(),
                  const BagBottomSheet(),
                  const DrinkBottomsheet()
                ];

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return Obx(() {
                      return bottomSheets[bottomSheetController.currentIndex];
                    });
                  },
                ).then((value) {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Image(
                        height: 110, image: NetworkImage(vehicle.vehicleLogo!)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vehicle.vehicleModel!,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.black,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Text(
                              "Up to ${vehicle.vehicleCapacity!} Seats",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                letterSpacing: 0.6,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$232",
                          // (vehicle.price * homePageController.distance! * 0.000621371)
                          //     .toStringAsFixed(2),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          if (vehicle.isSaved != null)
            Positioned(
                right: 0,
                child: Mutation(
                    options: MutationOptions(
                        onCompleted: (data) {
                          Navigator.pop(context);
                          if (data != null) {
                            if (refetch != null) {
                              refetch!();
                            }
                          }
                        },
                        onError: (error) {
                          Fluttertoast.showToast(msg: "Please try again!");
                        },
                        document: gql(saveReservationVehicleMutation)),
                    builder: (runMutation, result) {
                      return IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  LinearLoadingProgressIndicator(),
                            );
                            runMutation({
                              "userId": GetStorage().read('uid'),
                              "vehicleId": vehicle.vehicleMakeId
                            });
                          },
                          icon: vehicle.isSaved!
                              ? const Icon(
                                  Icons.favorite,
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  size: 20,
                                ));
                    }))
        ],
      ),
    );
    ;
  }
}
