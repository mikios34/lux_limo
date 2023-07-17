import 'package:beyride/api/reservation/mutation.dart';
import 'package:beyride/api/reservation/query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({
    super.key,
    required this.reservationId,
  });

  final int reservationId;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final Map<String, dynamic> data = {"rate": 5.0, "comment": ""};

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 15,
              ),
              Container(
                // padding: EdgeInsets.all(5),
                height: height * 7,
                width: height * 7,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100)),
                child: const Center(
                  child: Icon(Icons.done, size: 40, color: Colors.white),
                ),
              ),
              SizedBox(
                height: height * 2,
              ),
              Text(
                'Completed '.tr,
                style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 0.8,
                    color: Colors.black),
              ),
              SizedBox(
                height: height * 1,
              ),
              Text(
                'Trip has been successfully completed'.tr,
                style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    letterSpacing: 0.8,
                    color: Colors.grey.shade600),
              ),
              SizedBox(
                height: height * 5,
              ),
              // Query(
              //   options: QueryOptions(
              //       document: gql(checkIfReservationUserHasReviewedQuery),
              //       variables: {
              //         "userId": GetStorage().read("uid"),
              //         "reservation_id": widget.reservationId,
              //       }),
              //   builder: (result, {fetchMore, refetch}) {
              //     if (result.isLoading) {
              //       return Container();
              //     }
              //     if (result.hasException) {
              //       // return ErrorPage(refetch: refetch);
              //     }

              //     final isRated = result.data!['checkIfUserReviewedProduct'];

              //     if (!isRated) {
              //       return

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data['rate'].toString(),
                    style: GoogleFonts.inter(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: height * 1,
                  ),

                  RatingBar.builder(
                      itemSize: 25,
                      initialRating: 5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      unratedColor: Theme.of(context)
                          .primaryColorDark, //Color.fromRGBO(197, 201, 33, 1),
                      //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) =>
                          const Icon(Icons.star, color: Colors.black),
                      onRatingUpdate: (rating) {
                        data['rate'] = rating;
                        setState(() {});
                      }),
                  SizedBox(
                    height: height * 5,
                  ),
                  Text(
                    "Review".tr,
                    style: GoogleFonts.inter(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 0.8,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: height * 1,
                  ),
                  Text(
                    "How was your trip?".tr,
                    style: GoogleFonts.inter(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 0.8,
                        color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: height * 2,
                  ),
                  // const VerticalDivider(),

                  SizedBox(
                    height: height * 2,
                  ),
                  Form(
                    key: _fromKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 2,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 4,
                          maxLines: 5,
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.8,
                              color: Colors.black),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: InputBorder.none,
                            filled: true,
                            hintText: "Leave us a review".tr,
                            hintStyle: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.8,
                                color: Colors.black),
                          ),
                          onSaved: (newValue) {
                            data['comment'] = newValue;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Leave us a review".tr;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: height * 3,
                  ),

                  SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: Mutation(
                          options: MutationOptions(
                            document: gql(addReservationUserReviewMutation),
                            onCompleted: (data) {
                              setState(() {
                                _isLoading = false;
                              });
                              if (data != null) {
                                Get.until((route) {
                                  if (route.settings.name == "/HomePage") {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                });
                              }
                            },
                            onError: (error) {
                              Fluttertoast.showToast(msg: "Please try again");
                            },
                          ),
                          builder: (runMutation, result) {
                            return ElevatedButton(
                                onPressed: !_isLoading
                                    ? () {
                                        final form = _fromKey.currentState;
                                        if (form!.validate()) {
                                          form.save();
                                          setState(() {
                                            _isLoading = true;
                                          });

                                          runMutation({
                                            "userId": GetStorage().read("uid"),
                                            "reservationId":
                                                widget.reservationId,
                                            "reviewInput": {
                                              "comment": data['comment'],
                                              "rating": data['rate'],
                                            }
                                          });
                                        }
                                      }
                                    : null,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (_isLoading) const Spacer(),
                                    Text(
                                      "Submit Review".tr,
                                    ),
                                    if (_isLoading) ...[
                                      const Spacer(),
                                      const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                          strokeWidth: 1,
                                        ),
                                      )
                                    ]
                                  ],
                                ));
                          })),
                ],
              ),
              //       ;
              //     } else {
              //       return Center(
              //         child: Text(
              //           "Reservation rated".tr,
              //           style: GoogleFonts.inter(
              //               fontStyle: FontStyle.normal,
              //               fontWeight: FontWeight.w400,
              //               fontSize: 14,
              //               color: Colors.grey.shade600),
              //         ),
              //       );
              //     }
              //   },
              // ),
              SizedBox(
                height: height * 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
