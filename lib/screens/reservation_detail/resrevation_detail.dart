import 'dart:async';

import 'package:beyride/api/reservation/mutation.dart';
import 'package:beyride/api/reservation/query.dart';
import 'package:beyride/constant.dart';
import 'package:beyride/model/reservation/reservation.dart';
import 'package:beyride/screens/reviews/reviews.dart';
import 'package:beyride/util/error_page.dart';
import 'package:beyride/util/loading_progress_indicator.dart';
import 'package:beyride/util/util.dart';
import 'package:beyride/widget/reciept_bottomsheet.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReservationDetail extends StatefulWidget {
  const ReservationDetail({super.key, required this.reserevation});
  final Reservation reserevation;

  @override
  State<ReservationDetail> createState() => _ReservationDetailState();
}

class _ReservationDetailState extends State<ReservationDetail> {
  final reservationDetailController = Get.put(ReservationDetailController());
  late StreamSubscription<bool> keyboardSubscription;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    keyboardSubscription =
        KeyboardVisibilityController().onChange.listen((bool visible) {
      if (reservationDetailController.isVisible.value && !visible) {
        reservationDetailController.toggleVisibility();
      }
      print('Keyboard visibility update. Is visible: $visible');
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  late String emailAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white, //Theme.of(context).primaryColorDark,
        title: Text(
          "Trip# ${widget.reserevation.receiptNumber}",
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
                      reservation: widget.reserevation,
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
                            blurRadius: 7,
                            spreadRadius: 3,
                            color: Colors.grey.shade200,
                            offset: const Offset(0, 0))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
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
                              widget.reserevation.pickup!,
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 12,
                                  letterSpacing: 1.6,
                                  fontWeight: FontWeight.w300),
                            ))
                          ],
                        ),
                        Container(
                          height: 15,
                          margin: const EdgeInsets.only(
                            left: 18,
                          ),
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
                        if (widget.reserevation.stop != null) ...[
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
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
                                widget.reserevation.stop!,
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 12,
                                    letterSpacing: 1.6,
                                    fontWeight: FontWeight.w300),
                              ))
                            ],
                          ),
                          Container(
                            height: 15,
                            margin: const EdgeInsets.only(
                              left: 18,
                            ),
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
                              padding: const EdgeInsets.all(8),
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
                              widget.reserevation.dropoff!,
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 12,
                                  letterSpacing: 1.6,
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
                      height: 100,
                      image: NetworkImage(
                          widget.reserevation.vehicleMake!.vehicleLogo!)),
                  Text(
                    widget.reserevation.vehicleMake!.vehicleModel!,
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        letterSpacing: 0.8,
                        fontSize: 14,
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
                      formatDateToDateTime(widget.reserevation.date!), context),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildTripInfos(FeatherIcons.dollarSign,
                      widget.reserevation.price!.toStringAsFixed(2), context),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildTripInfos(FeatherIcons.creditCard, "****4232", context),
                ],
              ),
            ),
          ),
          Query(
            options: QueryOptions(
                fetchPolicy: FetchPolicy.networkOnly,
                document: gql(checkIfReservationUserHasReviewedQuery),
                variables: {
                  "userId": GetStorage().read("uid"),
                  "reservationId": widget.reserevation.reservationId,
                }),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading) {
                return Container();
              }
              if (result.hasException) {
              return ErrorPage(refetch: refetch);
              }

              final isRated = result.data == null
                  ? false
                  : result.data!['checkIfReservationUserHasReviewed'] ?? false;

              if (!isRated) {
                return Obx(() {
                  return !reservationDetailController.isVisible.value
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Divider(),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: ElevatedButton(
                                  onPressed:
                                      widget.reserevation.status == "Complete"
                                          ? () {
                                              Get.to(() => ReviewPage(
                                                    reservationId: widget
                                                        .reserevation
                                                        .reservationId!,
                                                  ));
                                            }
                                          : null,
                                  child: const Text("Rate your ride")),
                            )
                          ],
                        )
                      : const SizedBox.shrink();
                });
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          Obx(() => reservationDetailController.isVisible.value
              ? Stack(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 0),
                            color: Colors.grey.shade200,
                            spreadRadius: 2,
                            blurRadius: 5),
                      ]),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Send Reciept to:",
                            style: GoogleFonts.inter(
                                fontSize: 23,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.6),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Form(
                            key: _formKey,
                            child: Row(
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    style: inputTextStyle,
                                    autofocus: true,
                                    onSaved: (newValue) {
                                      emailAddress = newValue!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email is required';
                                      } else if (!RegExp(
                                              r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                                          .hasMatch(value)) {
                                        return 'Invalid email address';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 18, horizontal: 16),
                                      filled: true,
                                      hintText: "Your Email address.",
                                      errorStyle: inputTextStyle.copyWith(
                                          color: Colors.red),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    // border:
                                    //     Border.all(color: Theme.of(context).primaryColor, width: 1),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Mutation(
                                        options: MutationOptions(
                                          onCompleted: (data) {
                                            Navigator.pop(context);
                                            if (data != null) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Reciept sent to your email.",
                                                  toastLength:
                                                      Toast.LENGTH_LONG);
                                            }
                                          },
                                          onError: (error) {
                                            Fluttertoast.showToast(
                                                msg: "Please try again!");
                                          },
                                          document: gql(
                                              sendReservationRecieptByEmailMutation),
                                        ),
                                        builder: (runMutation, result) {
                                          return InkWell(
                                            onTap: () {
                                              final form =
                                                  _formKey.currentState;

                                              if (form!.validate()) {
                                                form.save();

                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      LinearLoadingProgressIndicator(),
                                                );
                                                runMutation({
                                                  "reservationId": widget
                                                      .reserevation
                                                      .reservationId,
                                                  "email": emailAddress
                                                });
                                              }
                                            },
                                            child: const Icon(
                                              Icons.send,
                                              color: Colors.white,
                                            ),
                                          );
                                        }),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        width: 28.0,
                        height: 28.0,
                        // margin: const EdgeInsets.only(right: 16, top: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              borderRadius: BorderRadius.circular(30.0),
                              onTap: () {
                                reservationDetailController.toggleVisibility();
                              },
                              child: const Icon(
                                Icons.clear,
                                color: Colors.black,
                                size: 15,
                              )),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(
                  height: 16,
                )),
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
            letterSpacing: 1.2,
            fontWeight: FontWeight.w400,
          )),
    );
  }
}

class ReservationDetailController extends GetxController {
  RxBool isVisible = false.obs;

  void toggleVisibility() {
    isVisible.toggle();
  }
}
