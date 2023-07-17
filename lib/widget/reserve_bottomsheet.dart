import 'dart:developer';

import 'package:beyride/api/mutaion.dart';
import 'package:beyride/controller/bottomsheet_controller.dart';
import 'package:beyride/controller/place_controller.dart';
import 'package:beyride/model/reservation/reservation.dart';
import 'package:beyride/model/vehicle.dart';
import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:beyride/screens/auth/controller/user_controller.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:beyride/util/loading_progress_indicator.dart';
import 'package:beyride/screens/reservation/reservation.dart';
import 'package:beyride/screens/success_checkout_page.dart';
import 'package:beyride/util/util.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

class ReservationBottomSheet extends StatefulWidget {
  ReservationBottomSheet({
    super.key,
    required this.vehicle,
  });
  final VehicleMake vehicle;

  @override
  State<ReservationBottomSheet> createState() => _ReservationBottomSheetState();
}

class _ReservationBottomSheetState extends State<ReservationBottomSheet> {
  final BottomSheetController bottomSheetController = Get.find();

  final HomePageController homePageController = Get.find();

  final PlaceController placeController = Get.find();

  final UserController userController = Get.find();

  final Map<String, dynamic> data = {};

  bool showAlert = false;

  @override
  Widget build(BuildContext context) {
    // Navigator.pop(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showAlert)
          Container(
            // height: 150,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Subtotal : ",
                    //   style: GoogleFonts.inter(
                    //     color: Colors.black,
                    //     fontSize: 12,
                    //     letterSpacing: 0.8,
                    //     fontWeight: FontWeight.w300,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Subtotal :   \$400",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 11,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Tax :           \$20",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 11,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Divider(),
                    ),
                    Text(
                      "Total :       \$420",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 12,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 25.0,
                    height: 25.0,
                    // margin: EdgeInsets.only(right: 25),
                    decoration: BoxDecoration(
                      // color: Color.fromRGBO(189, 248, 154, 1),
                      border: Border.all(color: Colors.black, width: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          borderRadius: BorderRadius.circular(30.0),
                          onTap: () {
                            showAlert = false;
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.black,
                            size: 13,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                minLeadingWidth: 40,
                leading: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          bottomSheetController.currentIndex = 1;
                        },
                        child: const Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.black,
                          size: 30,
                        )),
                    // SizedBox(
                    //   height: ,
                    // )
                  ],
                ),
                title: RichText(
                    text: TextSpan(
                        text: "\$",
                        style: GoogleFonts.inter(
                          color: Colors.grey.shade600,
                          fontSize: 18,
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                      TextSpan(
                        text: "420",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 26,
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ])),
                subtitle: InkWell(
                  splashColor: Colors.black,
                  radius: 5,
                  // style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onTap: () {
                    setState(() {
                      showAlert = true;
                    });
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Total Price",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 10,
                              letterSpacing: 0.4,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.help_outline,
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                trailing: Image(
                    height: 70,
                    image: NetworkImage(widget.vehicle.vehicleLogo!)),
              ),
              const SizedBox(
                height: 05,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 54.0,
                          height: 54.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            shape: BoxShape.circle,
                          ),
                          child: const Material(
                              color: Colors.transparent,
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                              )),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Text(
                          "${DateFormat.MMMEd().format(homePageController.date!)} - ${homePageController.time!.format(context)}",
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 14,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 60.0),
                      child: Divider(),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 54.0,
                          height: 54.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            shape: BoxShape.circle,
                          ),
                          child: const Material(
                              color: Colors.transparent,
                              child: Icon(
                                Icons.payment,
                                color: Colors.black,
                              )),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Text(
                          "Debit / Credit Card",
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 14,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Mutation(
                      options: MutationOptions(
                        onCompleted: (data) {
                          debugPrint("data is  $data");

                          Navigator.pop(context);
                          if (data != null) {
                            homePageController.resetHomePage();

                            final reservation =
                                Reservation.fromJson(data!['addReservation']);
                            Get.off(() => SuccessCheckoutPage(
                                  vehicle: widget.vehicle,
                                  reservation: reservation,
                                ));
                          }
                        },
                        document: gql(addReservation),
                        onError: (error) {
                          log("Errrorrrrr is $error");
                        },
                      ),
                      builder: (runMutation, result) {
                        return ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return LinearLoadingProgressIndicator();
                                },
                              );
                              data['pickup'] =
                                  homePageController.pickup!.placeName;
                              data['pickup_latitude'] =
                                  homePageController.pickup!.lat;
                              data['pickup_longitude'] =
                                  homePageController.pickup!.lng;
                              data['dropoff'] =
                                  homePageController.destination!.placeName;
                              data['dropoff_latitude'] =
                                  homePageController.destination!.lat;
                              data['dropoff_longitude'] =
                                  homePageController.destination!.lng;
                              data['stop'] = homePageController.stop?.placeName;
                              data['stop_latitude'] =
                                  homePageController.stop?.lat;
                              data['stop_longitude'] =
                                  homePageController.stop?.lng;
                              data['distance'] = 345;
                              // (placeController.direction.distanceValue);
                              data['price'] = 56;
                              // ((placeController.direction.distanceValue /
                              //         1000) *
                              //     6);
                              data['first_name'] =
                                  userController.user!.firstName;
                              data['last_name'] = userController.user!.lastName;
                              data['phone_number'] = "+251934540217";

                              data['reservation_temperature'] =
                                  bottomSheetController.temp;
                              data['reservation_play'] =
                                  bottomSheetController.play;
                              data['reservation_bag'] =
                                  bottomSheetController.bag;
                              data['reservation_drink'] =
                                  bottomSheetController.drink;

                              data['service_fee'] = 7.5;
                              data['total_paid'] = 345;
                              data['vehicle_id'] = widget.vehicle.vehicleMakeId;

                              print("Dataaaaaaaaaaaaaaaaaaa is $data");

                              runMutation({
                                "user_id": GetStorage().read("uid"),
                                "reservationInput": data
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // if (cardController.loading.value) const Spacer(),
                                Text(
                                  "Reserve",
                                  style: GoogleFonts.inter(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                // if (cardController.loading.value) const Spacer(),
                                // if (cardController.loading.value)
                                //   const SizedBox(
                                //     height: 20,
                                //     width: 20,
                                //     child: CircularProgressIndicator(
                                //       color: Colors.black,
                                //       strokeWidth: 1,
                                //     ),
                                //   )
                              ],
                            ));
                      })),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: ElevatedButton(
              //       onPressed: () {
              //         Get.to(() => ReservationsPage());
              //       },
              //       child: Text("Reserve Ride")),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
