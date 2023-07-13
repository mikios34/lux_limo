import 'package:beyride/api/splash/query.dart';
import 'package:beyride/model/user/user_model.dart';
import 'package:beyride/screens/auth/controller/user_controller.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:beyride/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  final userController = Get.put(UserController());
  final _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Query(
          options: QueryOptions(
              document: gql(getReservationHomeData),
              variables: {'userId': GetStorage().read('uid')}),
          builder: (result, {fetchMore, refetch}) {
            if (result.isNotLoading && !result.hasException) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                final data = result.data!['getReservationHomeData'];
                _homePageController.maxDistance = data['max_distance'];
                _homePageController.minDistance = data['min_distance'];
                _homePageController.supportedAreas =
                    (data['supported_areas'] as List).map((e) => '$e').toList();
                _homePageController.aboutUrl = data['about_us']['about_us'];
                _homePageController.privacyUrl =
                    data['about_us']['privacy_policy'];
                _homePageController.contactPhone =
                    data['contact_us']['telephone'];
                _homePageController.contactEmail = data['contact_us']['email'];

                if (data['user'] != null) {
                  userController.user = User.fromJson(data['user']);
                }

                Get.offAll(HomePage());
              });
            }
            return Container(
              padding: EdgeInsets.only(left: width * 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 108,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.asset(
                        "assets/images/lux.png",
                        fit: BoxFit.fill,
                        height: 90,
                        // width: 120,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ride with your Favourite Vehicle",
                    style: GoogleFonts.inter(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.6,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Chauferring Luxury",
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.6,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: height * 40,
                  )
                ],
              ),
            );
          }),
    );
  }
}
