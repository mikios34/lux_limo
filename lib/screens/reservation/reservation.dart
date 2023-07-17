import 'package:beyride/api/reservation/query.dart';
import 'package:beyride/model/reservation/reservation.dart';
import 'package:beyride/screens/reservation/widget/reservation_item.dart';
import 'package:beyride/util/empty_card.dart';
import 'package:beyride/util/error_page.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReservationsPage extends StatelessWidget {
  ReservationsPage({super.key});

  final reservationController = Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Reservations"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: Colors.black,
                          colorScheme: const ColorScheme.light(
                            primary: Colors.black,
                            onPrimary: Colors.white,
                            onSurface: Colors.black,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              primary: Theme.of(context)
                                  .primaryColor, // Text color of the buttons
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365)),
                    lastDate: DateTime.now());
                if (pickedDate != null) {
                  reservationController.isByDate(true);
                  reservationController.pickedDate(pickedDate.toString());
                }
              },
              icon: const Icon(FeatherIcons.calendar))
        ],
      ),
      body: Obx(() {
        return Query(
          options: QueryOptions(
              fetchPolicy: FetchPolicy.cacheAndNetwork,
              document: gql(reservationController.isByDate.value
                  ? getUserReservationByDate
                  : getUserReservation),
              variables: reservationController.isByDate.value
                  ? {
                      "userId": 1,
                      "date": reservationController.pickedDate.toString()
                    }
                  : {"userId": 1}),
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

            final List<Reservation> reservations = (result.data![
                    reservationController.isByDate.value
                        ? 'getUserReservationByDate'
                        : 'getUserReservation'] as List)
                .map((e) => Reservation.fromJson(e))
                .toList()
                .reversed
                .toList();
            return const EmptyImage(
                message: "It seems you don't have any trip history yet.");

            if (reservations.isEmpty) {
              return const EmptyImage(
                  message: "It seems you don't have any trip history yet.");
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ReservationItem(reserevation: reservations[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  itemCount: reservations.length),
            );
          },
        );
      }),
    );
  }
}

class ReservationController extends GetxController {
  var isByDate = false.obs;
  var pickedDate = Rxn<String>();
}
