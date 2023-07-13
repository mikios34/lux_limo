import 'package:beyride/api/preference/query.dart';
import 'package:beyride/controller/bottomsheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PlayBottomSheet extends StatefulWidget {
  const PlayBottomSheet({
    super.key,
  });

  @override
  State<PlayBottomSheet> createState() => _PlayBottomSheetState();
}

class _PlayBottomSheetState extends State<PlayBottomSheet> {
  // String dateText = 'Date';

  // String timeText = 'Time';
  bool showAlert = false;
  final BottomSheetController bottomSheetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showAlert)
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              children: [
                // SizedBox.shrink(),

                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    margin: const EdgeInsets.only(right: 25),
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
                            bottomSheetController.currentIndex = 1;
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
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        bottomSheetController.currentIndex = 1;
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black,
                      )),
                ),
              ),
              Text(
                "Play",
                style: GoogleFonts.inter(
                    letterSpacing: 0.6,
                    fontSize: 25,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Query(
                    options: QueryOptions(
                        document: gql(getReservationPreferencePlayOnlyQuery)),
                    builder: (result, {fetchMore, refetch}) {
                      final data = result.data!['getReservationPreference']
                          ['play'] as List;
                      return GridView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.4, crossAxisCount: 3),
                          itemBuilder: (context, index) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2,
                                            color: Color.fromRGBO(
                                                248, 233, 233, 1))),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          onTap: () {
                                            bottomSheetController.play =
                                                data[index]['title'];
                                            bottomSheetController.currentIndex =
                                                1;
                                          },
                                          child:
                                              Image.network(data[index]['url'])

                                          //  ImageIcon(
                                          //   NetworkImage(
                                          //       temps[index]['image_url']),
                                          //   color: null,
                                          // )
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    data[index]['title'],
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        letterSpacing: 0.06),
                                  )
                                ],
                              ));
                    }),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
