import 'package:beyride/api/notification/query.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:beyride/screens/notification/notification.dart';
import 'package:beyride/screens/reservation/reservation.dart';
import 'package:beyride/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});
  final HomePageController homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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

              Query(
                  options: QueryOptions(
                      document:
                          gql(reservationUserUnSeenNotificationCountQuery),
                      variables: {"userId": GetStorage().read('uid')}),
                  builder: (result, {fetchMore, refetch}) {
                    return Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => NotificationPage(
                                  refetch: refetch,
                                ));
                          },
                          icon: const Icon(Icons.notifications_outlined),
                          color: Colors.black,
                        ),
                        if (result.data != null)
                          if (result.data![
                                  'getReservationUserUnSeenNotificationCount'] !=
                              0)
                            Positioned(
                              right: 7,
                              top: 7,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                              ),
                            )
                      ],
                    );
                  }),
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
