import 'package:beyride/controller/bottomsheet_controller.dart';
import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateBottomSheet extends StatefulWidget {
  const DateBottomSheet({super.key, required this.vehicle});
  final VehicleMake vehicle;

  @override
  State<DateBottomSheet> createState() => _DateBottomSheetState();
}

class _DateBottomSheetState extends State<DateBottomSheet> {
  // String dateText = 'Date';

  // String timeText = 'Time';
  bool showAlert = false;
  final BottomSheetController bottomSheetController = Get.find();

  final HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showAlert)
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              children: [
                // SizedBox.shrink(),

                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Select Date",
                      style: GoogleFonts.inter(
                          letterSpacing: 0.6,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    margin: EdgeInsets.only(right: 25),
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
                            size: 18,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Image(
                  height: 100,
                  image: NetworkImage(widget.vehicle.vehicleLogo!)),
              Text(
                widget.vehicle.vehicleModel!,
                style: GoogleFonts.inter(
                    letterSpacing: 0.6,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "${widget.vehicle.vehicleCapacity} seats",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    letterSpacing: 0.6,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromRGBO(248, 248, 248, 1),
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                              context: context,
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    primaryColor: Theme.of(context)
                                        .primaryColor, // Background color of the calendar
                                    colorScheme: const ColorScheme.light(
                                      primary: Colors
                                          .black, // Header background color
                                      onPrimary:
                                          Colors.white, // Header text color
                                      onSurface:
                                          Colors.black, // Unselected text color
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        primary: Colors
                                            .black, // Text color of the buttons
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030));
                          if (pickedDate != null) {
                            homePageController.date = pickedDate;
                            if (homePageController.time == null) {
                              final pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      // Change the background color
                                      primaryColor: Colors
                                          .black, // Background color of the calendar
                                      colorScheme: const ColorScheme.light(
                                        primary: Colors
                                            .black, // Header background color
                                        onPrimary:
                                            Colors.white, // Header text color
                                        onSurface: Colors
                                            .black, // Unselected text color
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary: Colors
                                              .black, // Text color of the buttons
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (pickedTime != null) {
                                homePageController.time = pickedTime;
                              }
                            }
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                              // size: 20,
                            ),
                            Obx(() {
                              return Text(
                                homePageController.date == null
                                    ? "Date"
                                    : DateFormat.yMEd()
                                        .format(homePageController.date!),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.6,
                                  color: Colors.black,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromRGBO(248, 248, 248, 1),
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  // Change the background color
                                  primaryColor: Colors
                                      .black, // Background color of the calendar
                                  colorScheme: const ColorScheme.light(
                                    primary:
                                        Colors.black, // Header background color
                                    onPrimary:
                                        Colors.white, // Header text color
                                    onSurface:
                                        Colors.black, // Unselected text color
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary: Colors
                                          .black, // Text color of the buttons
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (pickedTime != null) {
                            homePageController.time = pickedTime;
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.lock_clock,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Obx(() {
                              return Text(
                                homePageController.time == null
                                    ? "Time"
                                    : homePageController.time!.format(context),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.6,
                                  color: Colors.black,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (homePageController.date == null ||
                        homePageController.date == null) {
                      setState(() {
                        showAlert = true;
                        setState(() {});
                      });
                    } else {
                      bottomSheetController.currentIndex = 1;
                      // Navigator.pop(context, 'forward');
                    }
                  },
                  child: const Text("Schedule")),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
