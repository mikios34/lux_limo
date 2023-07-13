// import 'package:beyride/model/vehicle.dart';
// import 'package:beyride/screens/booking_detail.dart';
// import 'package:feather_icons/feather_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SearchPage extends StatefulWidget {
//   final List<Vehicle> vehicles;
//   const SearchPage({super.key, required this.vehicles});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   String keyword = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 70,
//         elevation: 0.3,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios_new,
//               color: Colors.black,
//             )),
//         title: Text(
//           "Search",
//           style: GoogleFonts.inter(
//               color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
//         ),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(40),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: TextFormField(
//               onChanged: (value) {
//                 keyword = value;
//                 setState(() {});
//                 // if (homeSearchController.selectedMenu.value == "Order") {
//                 //   searchController.changeKeyword((int.parse(value)));
//                 // } else {
//                 //   searchproductController.changeKeyword(value);
//                 // }
//               },
//               autofocus: true,
//               style: GoogleFonts.inter(
//                   fontStyle: FontStyle.normal,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black),
//               decoration: InputDecoration(
//                   isDense: true, // Added this

//                   prefixIcon: const Padding(
//                     padding: EdgeInsets.only(left: 20, right: 15),
//                     child: Icon(
//                       FeatherIcons.search,
//                       color: Colors.grey,
//                       size: 15,
//                     ),
//                   ),
//                   suffixIcon: IconButton(
//                       onPressed: () {
//                         // _serchController.clear();
//                       },
//                       icon: const Icon(
//                         FeatherIcons.x,
//                         color: Colors.grey,
//                         size: 15,
//                       )),
//                   // hintText: homeSearchController.selectedMenu.value == 'Order'
//                   //     ? "${"Search by Order # ...".tr}"
//                   //     : "${"Search Product ...".tr}",
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide:
//                           const BorderSide(width: 0.3, color: Colors.grey)),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide:
//                           const BorderSide(width: 0.3, color: Colors.grey))),
//             ),
//           ),
//         ),
//       ),
//       body: ListView.separated(
//           itemBuilder: (context, index) => ListTile(
//                 onTap: () {
//                   Get.to(BookingDetail(
//                     vehicle: widget.vehicles
//                         .where((element) => element.name.contains(keyword))
//                         .toList()[index],
//                   ));
//                 },
//                 title: Text(widget.vehicles
//                     .where((element) => element.name.contains(keyword))
//                     .toList()[index]
//                     .name),
//               ),
//           separatorBuilder: (context, index) => Divider(),
//           itemCount: widget.vehicles
//               .where((element) => element.name.contains(keyword))
//               .length),
//     );
//   }
// }
