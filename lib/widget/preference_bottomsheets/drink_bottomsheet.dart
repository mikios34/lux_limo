import 'package:beyride/api/preference/query.dart';
import 'package:beyride/controller/bottomsheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DrinkBottomsheet extends StatefulWidget {
  const DrinkBottomsheet({Key? key}) : super(key: key);

  @override
  State<DrinkBottomsheet> createState() => _DrinkBottomsheetState();
}

class _DrinkBottomsheetState extends State<DrinkBottomsheet> {
  bool showAlert = false;
  final BottomSheetController bottomSheetController = Get.find();
  List<int> quantities = []; // List to store the quantities for each item
  String? selectedDrink;
  @override
  void initState() {
    super.initState();
    // Initialize the quantities list with 0 values
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showAlert)
          if (showAlert)
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                children: [
                  // SizedBox.shrink(),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Select at least one drink",
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
                            onTap: () {},
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
                    ),
                  ),
                ),
              ),
              Text(
                "Drink",
                style: GoogleFonts.inter(
                  letterSpacing: 0.6,
                  fontSize: 23,
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Query(
                  options: QueryOptions(
                      document: gql(getReservationPreferenceDrinkOnlyQuery)),
                  builder: (result, {fetchMore, refetch}) {
                    final data = result.data!['getReservationPreference']
                        ['drink'] as List;
                    if (quantities.isEmpty) {
                      quantities = List<int>.filled(data.length, 0);
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Color.fromRGBO(248, 233, 233, 1),
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30.0),
                                onTap: () {
                                  bottomSheetController.drink =
                                      "${data[index]['title']} (x${quantities[index]})";
                                  bottomSheetController.currentIndex = 1;
                                },
                                child: Image.network(data[index]['image_url']),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(2.0),
                                color: Theme.of(context).primaryColorDark,
                                child: InkWell(
                                  onTap: () {
                                    // Decrement the quantity when minus icon is pressed
                                    setState(() {
                                      quantities[index] = quantities[index] > 0
                                          ? quantities[index] - 1
                                          : 0;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Text(
                                '${quantities[index]}', // Display the quantity count
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  letterSpacing: 0.6,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(2.0),
                                color: Theme.of(context).primaryColorDark,
                                child: InkWell(
                                  onTap: () {
                                    final val = quantities[index];

                                    // Increment the quantity when plus icon is pressed
                                    setState(() {
                                      quantities =
                                          quantities.map((value) => 0).toList();
                                      quantities[index] =
                                          val < data[index]['length']
                                              ? val + 1
                                              : 10;
                                    });
                                    bottomSheetController.drink =
                                        "${data[index]['title']} (x${quantities[index]})";
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            data[index]['title'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    onPressed: () {
                      if (quantities.every((element) => element == 0)) {
                        setState(() {
                          showAlert = true;
                        });
                      } else {
                        bottomSheetController.currentIndex = 1;
                      }
                    },
                    child: Text("Add Drink For Free")),
              ),
              // const SizedBox(
              //   height: 40,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
