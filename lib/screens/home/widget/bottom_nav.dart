import 'package:beyride/screens/home/home_controller.dart';
import 'package:beyride/screens/reservation/reservation.dart';
import 'package:beyride/screens/settings/settings.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});
  final HomePageController homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  homePageController.showSearchPanel = false;
                },
                icon: const Icon(Icons.location_pin),
                color: Colors.black,
              ),
              // const Icon(Icons.location_pin),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
                color: Colors.black,
              ),
              // const Icon(Icons.notifications_outlined),

              IconButton(
                onPressed: () {
                  Get.to(() => ReservationsPage());
                },
                icon: const Icon(Icons.history),
                color: Colors.black,
              ),
              // const Icon(Icons.history),

              IconButton(
                onPressed: () {
                  Get.to(() => SettingsPage());
                },
                icon: const Icon(Icons.settings),
                color: Colors.black,
              ),
              // const Icon(Icons.settings),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
