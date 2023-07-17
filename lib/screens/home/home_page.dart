import 'package:beyride/api/query.dart';
import 'package:beyride/controller/place_controller.dart';
import 'package:beyride/model/address/address_model.dart';
import 'package:beyride/model/reservation/reservation.dart';
import 'package:beyride/screens/auth/controller/user_controller.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:beyride/screens/home/widget/airports.dart';
import 'package:beyride/screens/home/widget/app_bar.dart';
import 'package:beyride/screens/home/widget/bottom_nav.dart';
import 'package:beyride/screens/home/widget/location_search_result.dart';
import 'package:beyride/screens/home/widget/recent_locations.dart';
import 'package:beyride/screens/home/widget/saved_addresses.dart';
import 'package:beyride/util/error_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'widget/upcoming_events.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _homePageController = Get.put(HomePageController());

  final placeController = Get.put(PlaceController());
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBar(),
            Expanded(
              child: Obx(() {
                if (_homePageController.showSearchPanel) {
                  return LocationSearchResult();
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${getGreeting()},\n${userController.user!.firstName} ",
                        style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            letterSpacing: 1.6),
                      ),
                      Query(
                        options: QueryOptions(
                            document: gql(
                                getReservationUpcomingAndAddressInformationQuery),
                            variables: {"userId": GetStorage().read('uid')}),
                        builder: (result, {fetchMore, refetch}) {
                          if (result.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            );
                          }

                          if (result.hasException) {
                            return ErrorPage(refetch: refetch);
                          }
                          final data = result.data![
                              'getReservationUpcomingAndAddressInformation'];
                          final upcoming = data['upcoming'];
                          final savedAddress = data['saved_address'];
                          final recentAddress = data['recent_address'];

                          if (upcoming != null &&
                              (upcoming as List).isNotEmpty) {
                            return UpcomingEvents(
                                reservations: (upcoming as List)
                                    .map((e) => Reservation.fromJson(e))
                                    .toList()
                                    .reversed
                                    .toList());
                          }
                          if (recentAddress != null) {
                            return RecentLocations(
                              locations: recentAddress,
                            );
                          }
                          if (savedAddress != null &&
                              (savedAddress as List).isNotEmpty) {
                            return SavedAddresses(
                              addresses: (savedAddress as List)
                                  .map((e) => Address.fromJson(e))
                                  .toList()
                                  .reversed
                                  .toList(),
                            );
                          }
                          return Container();
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AirPorts(),
                    ],
                  ),
                );
              }),
            ),
            // BottomNav()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BottomNav(),
      ),
    );
  }

  String getGreeting() {
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;

    if (currentHour >= 0 && currentHour < 12) {
      return 'Good Morning';
    } else if (currentHour >= 12 && currentHour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
