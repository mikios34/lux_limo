import 'package:beyride/api/query.dart';
import 'package:beyride/model/reservation/reservation.dart';
import 'package:beyride/util/util.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key, required this.reservations});
  final List<Reservation> reservations;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upcoming",
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
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) => Container(
                    // margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //       blurRadius: 2,
                      //       spreadRadius: 3,
                      //       color: Colors.grey.shade200,
                      //       offset: const Offset(0, 0))
                      // ],
                      border: Border.all(color: Colors.black, width: 0.1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 21, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "${getDatefromDateTime(reservations[index].date!)} - ${getTimefromDateTime(reservations[index].date!)}",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                              reservations[index].pickup!,
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
                          margin: const EdgeInsets.only(
                              left: 20, top: 6, bottom: 6),
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
                        if (reservations[index].stop != null) ...[
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
                                reservations[index].stop!,
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
                            margin: const EdgeInsets.only(
                                left: 20, top: 6, bottom: 6),
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
                              reservations[index].dropoff!,
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 12,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.w300),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => Container(
                    padding: EdgeInsets.only(left: 50),
                    child: Divider(),
                  ),
              itemCount: reservations.length)
        ],
      ),
    );
  }
}
