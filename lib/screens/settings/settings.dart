import 'package:beyride/api/user/mutation.dart';
import 'package:beyride/screens/address/address.dart';
import 'package:beyride/screens/auth/controller/user_controller.dart';
import 'package:beyride/screens/edit_profile/edit_profile.dart';
import 'package:beyride/screens/home/home_controller.dart';
import 'package:beyride/screens/payment/payment.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  final UserController userController = Get.find();
  final HomePageController homePageController = Get.find();

  final settingController = Get.put(SettingController());

  SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 50,
        title: null,
      ),
      body: Obx(() {
        return ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Stack(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                              width: double.infinity,
                              // height: ,
                              fit: BoxFit.cover,
                              imageUrl: userController.user!.profilePicture!),
                        ),
                        // backgroundImage: userController.user!.profilePicture !=
                        //         null
                        //     ? NetworkImage(userController.user!.profilePicture!)
                        //     : null,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userController.user != null
                                  ? "${userController.user!.firstName!} ${userController.user!.lastName!}"
                                  : 'Name',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              userController.user == null
                                  ? 'Email address'
                                  : userController.user!.email!,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0.8,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      onPressed: () {
                        Get.to(EditProfilePage());
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            const Divider(),
            const SizedBox(height: 16.0),
            _buildTiles(
              title: "Address",
              icon: Icons.home,
              context: context,
              onTap: () {
                Get.to(() => AddressesPage());
              },
            ),
            const SizedBox(height: 16.0),
            _buildTiles(
              title: "Payment",
              icon: Icons.payment,
              context: context,
              onTap: () => Get.to(() => PaymentPage()),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25),
              leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                    size: 30,
                  )),
              title: Text(
                'Notification',
                style: GoogleFonts.inter(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.8,
                    color: Colors.black),
              ),
              trailing: SizedBox(
                width: 45,
                child: FlutterSwitch(
                  inactiveColor: Colors.grey,
                  activeColor: Colors.black,
                  height: 18.0,
                  width: 40,
                  value: userController.user != null
                      ? userController.user!.notificationPreference!
                      : false,
                  borderRadius: 30.0,
                  padding: 3,
                  onToggle: (val) {
                    if (userController.user != null) {
                      changeNotification(GraphQLProvider.of(context).value);
                    }

                    // if (GetStorage().read("uid") != null) {
                    //   changeNotification();
                    // }
                  },
                ),
              ),
              onTap: () {
                if (userController.user != null) {
                  changeNotification(GraphQLProvider.of(context).value);
                }
              },
            ),
            const SizedBox(height: 16.0),
            _buildTiles(
              title: "About",
              icon: Icons.help,
              context: context,
              onTap: () async {
                await launchUrl(Uri.parse(homePageController.aboutUrl),
                    mode: LaunchMode.inAppWebView);
              },
            ),
            const SizedBox(height: 16.0),
            _buildTiles(
              title: "Help",
              icon: Icons.call,
              context: context,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    )),
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: SizedBox(
                                width: 60,
                                child: Divider(
                                  thickness: 3,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, bottom: 20),
                            child: Text(
                              "Contact".tr,
                              style: GoogleFonts.inter(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  letterSpacing: 0.8,
                                  fontSize: 20),
                            ),
                          ),
                          ListTile(
                            onTap: () async {
                              Navigator.pop(context);
                              final Uri launchUri = Uri(
                                scheme: 'tel',
                                path: homePageController.contactPhone,
                              );
                              await launch(launchUri.toString());
                            },
                            leading: const Icon(
                              FeatherIcons.phoneCall,
                              color: Colors.black,
                              // size: 20,
                            ),
                            title: Text('Phone'.tr,
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.8,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black)),
                          ),
                          Container(
                            height: 0.2,
                            margin: const EdgeInsets.only(left: 70),
                            color: Colors.grey,
                          ),
                          ListTile(
                            onTap: () async {
                              Navigator.pop(context);

                              final Uri emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: homePageController.contactEmail,
                              );

                              launchUrl(emailLaunchUri);
                            },
                            leading: const Icon(
                              FeatherIcons.mail,
                              color: Colors.black,
                              // size: 20,
                            ),
                            title: Text('Email'.tr,
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.8,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black)),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      );
                    });
              },
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            _buildTiles(
                title: "Sign out", trailing: Icons.logout, context: context),
          ],
        );
      }),
    );
  }

  Widget _buildTiles({
    required String title,
    IconData? icon,
    Function()? onTap,
    required BuildContext context,
    IconData? trailing,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 25),
      leading: icon == null
          ? null
          : Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.black,
                size: 30,
              )),
      title: Text(
        title,
        style: GoogleFonts.inter(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.2,
            color: Colors.black),
      ),
      onTap: userController.user == null ? null : onTap,
      trailing: trailing != null
          ? Icon(
              trailing,
              color: Colors.black,
            )
          : null,
    );
  }

  changeNotification(GraphQLClient client) {
    Get.showSnackbar(GetSnackBar(
        isDismissible: true,
        borderRadius: 10,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.black.withOpacity(0.8),
        messageText: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                userController.user!.notificationPreference!
                    ? 'Disabling Notification'
                    : 'Enabling Notification',
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Colors.white)),
            Obx(() {
              if (settingController.isLoading.value) {
                return const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                );
              }
              return const Icon(
                Icons.done,
                color: Colors.white,
                size: 20,
              );
            }),
          ],
        )));
    settingController.isLoading.value = true;
    client
        .mutate(MutationOptions(
            document: gql(updateReservationUserNotificationPreference),
            variables: {
          "user_id": GetStorage().read('uid'),
          "notification_preference":
              !userController.user!.notificationPreference!
        }))
        .then((value) {
      settingController.isLoading.value = false;

      Future.delayed(const Duration(seconds: 2), () {
        Get.closeAllSnackbars();
      });
      userController.user = userController.user!.copyWith(
          notificationPreference:
              !userController.user!.notificationPreference!);
    }).onError((error, stackTrace) {
      settingController.isLoading.value = false;

      Future.delayed(const Duration(seconds: 2), () {
        Get.closeAllSnackbars();
      });
    });
  }
}

class SettingController extends GetxController {
  var isLoading = false.obs;
}
