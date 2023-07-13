import 'package:beyride/api/reservation/query.dart';
import 'package:beyride/model/reservation/reservation.dart';
import 'package:beyride/screens/reviews/reviews.dart';
import 'package:beyride/util/util.dart';
import 'package:beyride/widget/reciept_bottomsheet.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReservationDetail extends StatelessWidget {
  const ReservationDetail({super.key, required this.reserevation});
  final Reservation reserevation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white, //Theme.of(context).primaryColorDark,
        title: Text(
          "Trip# ${reserevation.receiptNumber}",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 16,
            letterSpacing: 0.6,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(
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
                    return RecieptBottomSheet(
                      reservation: reserevation,
                    );
                  },
                );
              },
              icon: const Icon(FeatherIcons.printer))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 21, horizontal: 16.0),
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
                              reserevation.pickup!,
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
                              reserevation.dropoff!,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Image(
                      height: 130,
                      image:
                          NetworkImage(reserevation.vehicleMake!.vehicleLogo!)),
                  Text(
                    reserevation.vehicleMake!.vehicleModel!,
                    style: GoogleFonts.inter(
                        letterSpacing: 0.6,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildTripInfos(FeatherIcons.calendar,
                      formatDateToDateTime(reserevation.date!), context),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildTripInfos(FeatherIcons.dollarSign,
                      reserevation.price!.toStringAsFixed(2), context),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildTripInfos(FeatherIcons.creditCard, "****4232", context),
                ],
              ),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 12,
          ),
          Query(
            options: QueryOptions(
                document: gql(checkIfReservationUserHasReviewedQuery),
                variables: {
                  "userId": GetStorage().read("uid"),
                  "reservation_id": reserevation.reservationId,
                }),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading) {
                return Container();
              }
              if (result.hasException) {
                // return ErrorPage(refetch: refetch);
              }

              final isRated = result.data!['checkIfUserReviewedProduct']??false;

              if (!isRated) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //   // elevation: 0,
                      //   backgroundColor: Theme.of(context).primaryColorDark,
                      //   foregroundColor: Colors.black,
                      //   // minimumSize: const Size.fromHeight(45),
                      // ),
                      onPressed: reserevation.status == "Complete"
                          ? () {
                              Get.to(() => ReviewPage(
                                    reservationId: reserevation.reservationId!,
                                  ));
                            }
                          : null,
                      child: const Text("Rate your ride")),
                );
              } else {
                return Center(
                  child: Text(
                    "Reservation rated".tr,
                    style: GoogleFonts.inter(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey.shade600),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  Widget _buildTripInfos(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
      ),
      title: Text(title,
          style: GoogleFonts.inter(
            fontSize: 14,
            letterSpacing: 0.6,
            fontWeight: FontWeight.w400,
          )),
    );
  }
}
