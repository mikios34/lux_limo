import 'package:beyride/api/reservation/query.dart';
import 'package:beyride/model/reservation/reservation.dart';
import 'package:beyride/screens/reservation_detail/resrevation_detail.dart';
import 'package:beyride/screens/reviews/reviews.dart';
import 'package:beyride/util/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReservationTrackerPage extends StatelessWidget {
  const ReservationTrackerPage({super.key, required this.reservation});
  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(
                    reservation.pickupLatitude!, reservation.pickupLongitude!)),
          ),
          Positioned(
              top: kToolbarHeight,
              right: 16.0,
              child: Container(
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  shape: BoxShape.circle,
                  // border:
                  //     Border.all(color: Theme.of(context).primaryColor, width: 1),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.clear),
                  ),
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 45,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              getDatefromDateTime(reservation.date!),
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              getTimefromDateTime(reservation.date!),
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Image.network(
                            height: 80, reservation.vehicleMake!.vehicleLogo!)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  //   decoration: BoxDecoration(
                  //     color: Theme.of(context).primaryColorDark,
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       "Chauferre has been assigned",
                  //       style: GoogleFonts.inter(
                  //           color: Colors.black,
                  //           fontSize: 18,
                  //           letterSpacing: 0.6,
                  //           fontWeight: FontWeight.w500),
                  //     ),
                  //   ),
                  // ),
                  Query(
                      options: QueryOptions(
                          fetchPolicy: FetchPolicy.cacheAndNetwork,
                          pollInterval: Duration(seconds: 5),
                          document: gql(getReservationByIdQuery),
                          variables: {
                            "userId": GetStorage().read('uid'),
                            "reservationId": reservation.reservationId
                          }),
                      builder: (result, {fetchMore, refetch}) {
                        final status =
                            result.data!['getReservationById']['status'];

                        if (status == "Complete") {
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            Get.off(() => ReviewPage(
                                reservationId: reservation.reservationId!));
                          });
                        }
                        if (result.isNotLoading && !result.hasException) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 25),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                            ),
                            child: Center(
                              child: Text(
                                status == "Waiting"
                                    ? "We've received your reservation."
                                    : "Chauferre has been assigned",
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 16,
                                    letterSpacing: 0.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        }
                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 25),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                          ),
                          child: Center(
                            child: Text(
                              reservation.status == "Waiting"
                                  ? "We've received your reservation."
                                  : "Chauferre has been assigned",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(ReservationDetail(reserevation: reservation));
                        },
                        child: Text("View Trip Detail")),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
