import 'package:beyride/model/reservation/reservation.dart';
import 'package:beyride/screens/reservation_detail/resrevation_detail.dart';
import 'package:beyride/screens/reservation_tracker/reservation_tracker.dart';
import 'package:beyride/util/util.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReservationItem extends StatelessWidget {
  final Reservation reserevation;

  ReservationItem({
    super.key,
    required this.reserevation,
  });

  @override
  Widget build(BuildContext context) {
    // print("jobbbbbbbbbbbbb is ${job.minutesWaiting}");
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 2,
              spreadRadius: 3,
              color: Colors.grey.shade200,
              offset: const Offset(0, 0))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    getDatefromDateTime(reserevation.date!),
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 16,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    getTimefromDateTime(reserevation.date!),
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 16,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Image.network(height: 60, reserevation.vehicleMake!.vehicleLogo!)
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.location_pin,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                        child: Text(
                      reserevation.pickup!,
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 14,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.w300),
                    ))
                  ],
                ),
                Container(
                  height: 15,
                  margin: const EdgeInsets.only(left: 20, top: 6, bottom: 6),
                  child: DottedLine(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    lineLength: 10,
                    lineThickness: 1.0,
                    dashLength: 2,
                    dashColor: Colors.black,
                    dashRadius: 0.0,
                    dashGapLength: 2.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  ),
                ),
                if (reserevation.stop != null) ...[
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.location_pin,
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                          child: Text(
                        reserevation.stop!,
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            letterSpacing: 0.6,
                            fontWeight: FontWeight.w300),
                      ))
                    ],
                  ),
                  Container(
                    height: 15,
                    margin: const EdgeInsets.only(left: 20, top: 6, bottom: 6),
                    child: const DottedLine(
                      direction: Axis.vertical,
                      alignment: WrapAlignment.center,
                      lineLength: 10,
                      lineThickness: 1.0,
                      dashLength: 2,
                      dashColor: Colors.black,
                      dashRadius: 0.0,
                      dashGapLength: 2.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                  ),
                ],
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.location_pin,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                        child: Text(
                      reserevation.dropoff!,
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 14,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.w300),
                    ))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          if (reserevation.status != "Complete")
            SizedBox(
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(ReservationTrackerPage(reservation: reserevation));
                  },
                  child: const Text("Track Reservation")),
            ),
          if (reserevation.status == "Complete")
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColorDark,
                  foregroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(45),
                ),
                onPressed: () {
                  Get.to(() => ReservationDetail(reserevation: reserevation));
                },
                child: const Text("View Reservation")),
        ],
      ),
    );
  }
}
