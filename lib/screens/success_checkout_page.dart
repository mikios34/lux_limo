import 'package:beyride/model/reservation/reservation.dart';
import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:beyride/screens/home/home_page.dart';
import 'package:beyride/screens/reservation_detail/resrevation_detail.dart';
import 'package:beyride/screens/reservation_tracker/reservation_tracker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessCheckoutPage extends StatelessWidget {
  SuccessCheckoutPage(
      {super.key, required this.vehicle, required this.reservation});

  final VehicleMake vehicle;
  final HomePageController homePageController = Get.find();
  final Reservation reservation;

  // final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              // height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 15,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            // boxShadow: const [
                            //   BoxShadow(color: Colors.grey, blurRadius: 3)
                            // ],
                            // color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: Container(
                          padding: const EdgeInsets.all(5),

                          // height: height * 40,
                          // width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100)),

                          child: const Icon(Icons.done,
                              size: 40, color: Colors.white),
                          // child: ClipRRect(
                          //   borderRadius: BorderRadius.circular(6),
                          //   child: const Image(
                          //       fit: BoxFit.cover,
                          //       image: NetworkImage('ov.imageUrl')),
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 1,
                    ),
                    Text(
                      'Reserved!',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.6,
                      ),
                    ),
                    SizedBox(
                      height: height * 2,
                    ),
                    Image(
                        height: 120, image: NetworkImage(vehicle.vehicleLogo!)),
                    SizedBox(
                      height: height * 5,
                    ),
                    Text(
                      vehicle.vehicleModel!,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Colors.black,
                        letterSpacing: 0.6,
                      ),
                    ),
                    SizedBox(
                      height: height * 1,
                    ),
                    Text(
                      "${DateFormat.MMMEd().format(homePageController.date!)} - ${homePageController.time!.format(context)}",
                      // DateFormat.yMMMMEEEEd()
                      //     .format(DateTime.parse(data['date'])),
                      // 'A description that comes from the db world,We need to know where you reside to provide you best service',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: height * 6,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: Colors.black, width: 0.2))),
                          onPressed: () {
                            Get.to(ReservationTrackerPage(
                                reservation: reservation));
                          },
                          child: const Text("View On Reservation")),
                    ),
                    SizedBox(
                      height: height * 2,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).primaryColorDark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          onPressed: () {
                            Get.to(() =>
                                ReservationDetail(reserevation: reservation));
                            // Get.offUntil(page, (route) => false)
                          },
                          child: Row(
                            children: [
                              Flexible(
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: Icon(Icons.print))),
                              Flexible(
                                  flex: 2,
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: const Text("Get Reciept"))),
                              // Spacer(),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 65,
              right: 35,
              child: InkWell(
                onTap: () {
                  // Get.close(2);

                  Get.until((route) {
                    if (route.settings.name == "/HomePage") {
                      return true;
                    } else {
                      return false;
                    }
                  });
                },
                child: const Icon(
                  Icons.clear,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
