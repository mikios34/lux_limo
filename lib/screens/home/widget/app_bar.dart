import 'package:beyride/constant.dart';
import 'package:beyride/controller/place_controller.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatefulWidget {
  HomeAppBar({Key? key}) : super(key: key);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final HomePageController homePageController = Get.find();

  final PlaceController placeController = Get.find();

  @override
  void initState() {
    super.initState();
    homePageController.pickupFocusNode = FocusNode();
    homePageController.stopFocusNode = FocusNode();
    homePageController.destinationFocusNode = FocusNode();
  }

  @override
  void dispose() {
    homePageController.pickupFocusNode.dispose();
    homePageController.stopFocusNode.dispose();
    homePageController.destinationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(0, 96.0, 0, 16.0),
        child: Row(
          children: [
            Column(
              children: [
                const Icon(
                  Icons.location_pin,
                  color: Colors.black,
                  size: 20,
                ),
                const SizedBox(
                  height: 25,
                  child: DottedLine(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    lineLength: 20,
                    lineThickness: 1.0,
                    dashLength: 2,
                    dashColor: Colors.black,
                    dashRadius: 0.0,
                    dashGapLength: 2.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  ),
                ),
                if (homePageController.showStopPicker) ...[
                  const Icon(
                    Icons.location_pin,
                    color: Colors.black,
                    size: 20,
                  ),
                  const SizedBox(
                    height: 25,
                    child: DottedLine(
                      direction: Axis.vertical,
                      alignment: WrapAlignment.center,
                      lineLength: 20,
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
                const Icon(
                  Icons.location_pin,
                  color: Colors.black,
                  size: 20,
                ),
                Container(
                  height: 1,
                  width: 12,
                  color: Colors.black,
                )
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        TextFormField(
                          style: inputTextStyle,
                          controller:
                              homePageController.pickupTextEditingController,
                          focusNode: homePageController.pickupFocusNode,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(3)),
                              hintText: 'Pickup',
                              filled: true,
                              fillColor:
                                  const Color.fromRGBO(248, 248, 248, 1)),
                          onChanged: (value) {
                            placeController.searchPlace(value);
                          },
                          onTap: () {
                            homePageController.handleFocusChange(
                                homePageController.pickupFocusNode);
                          },
                        ),
                        if (homePageController.showStopPicker) ...[
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: inputTextStyle,
                            controller:
                                homePageController.stopeTextEditingController,
                            focusNode: homePageController.stopFocusNode,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(3)),
                                hintText: 'Stop',
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(248, 248, 248, 1)),
                            onChanged: (value) {
                              placeController.searchPlace(value);
                            },
                            onTap: () {
                              homePageController.handleFocusChange(
                                  homePageController.stopFocusNode);
                            },
                          ),
                        ],
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            TextFormField(
                              style: inputTextStyle,
                              controller: homePageController
                                  .destinationTextEditingController,
                              focusNode:
                                  homePageController.destinationFocusNode,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(3)),
                                  hintText: 'Destination',
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(248, 248, 248, 1)),
                              onChanged: (value) {
                                placeController.searchPlace(value);
                              },
                              onTap: () {
                                homePageController.handleFocusChange(
                                    homePageController.destinationFocusNode);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 3,
                    bottom: 30,
                    child: SizedBox(
                      height: 33,
                      width: 33,
                      child: Container(
                        // backgroundColor: Color.fromRGBO(238, 238, 238, 1),
                        // elevation: 15,
                        // highlightElevation: 10,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  color: Colors.grey.shade200,
                                  spreadRadius: 2,
                                  blurRadius: 4)
                            ],
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColorDark),

                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          shape: CircleBorder(),
                          onPressed: () {
                            homePageController.showStopPicker =
                                !homePageController.showStopPicker;
                          },
                          child: Center(
                            child: Icon(
                              homePageController.showStopPicker
                                  ? Icons.remove
                                  : Icons.add,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
