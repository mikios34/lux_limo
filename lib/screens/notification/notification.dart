import 'package:beyride/api/notification/query.dart';
import 'package:beyride/model/notification.dart';
import 'package:beyride/util/empty_card.dart';
import 'package:beyride/util/error_page.dart';
import 'package:beyride/util/one_line_text_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lottie/lottie.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key, required this.refetch});

  final Future<QueryResult<Object?>?> Function()? refetch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Notifications',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
          ),
        ),
        body: Query(
            options: QueryOptions(
                fetchPolicy: FetchPolicy.cacheAndNetwork,
                document: gql(getReservationUserNotificationQuery),
                variables: {"userId": GetStorage().read('uid')}),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading) {
                return const OneLineTextShimmer();
              }
              if (result.hasException) {
                return ErrorPage(refetch: refetch);
              }
              List<Notifications> notifcationn =
                  (result.data!['getReservationUserNotification'] as List)
                      .map((e) => Notifications.fromGraphql(e))
                      .toList();

              if (notifcationn.isEmpty) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                        height: 250,
                        child: LottieBuilder.asset(
                            "assets/lottie/notification_lottie.json")),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.2),
                      child: Text(
                        "It seems you don't have new notification yet",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  ],
                );

                // return const EmptyPage(
                //     message: "You don't have new notification");
              }
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return _buildNotification(notifcationn, index, context);
                  },
                  itemCount: notifcationn.length);
            }));
  }

  Widget _buildNotification(
      List<Notifications> notifications, int index, context) {
    Notifications notification = notifications[index];

    return Dismissible(
      key: const Key("item."),
      confirmDismiss: (direction) async {},
      onDismissed: (DismissDirection d) async {},
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: const [
            Icon(
              Icons.delete_outlined,
              color: Colors.redAccent,
            ),
            Spacer(),
            Icon(
              Icons.delete_outlined,
              color: Colors.redAccent,
            )
          ],
        ),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () async {},
            leading: Container(
              width: 44.0,
              height: 44.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                shape: BoxShape.circle,
              ),
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Icon(
                    Icons.notifications_on,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                notification.title,
                style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.subtitle,
                  style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: const Color.fromRGBO(131, 125, 125, 1),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.2, top: 10),
            width: double.infinity,
            height: 0.15,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
