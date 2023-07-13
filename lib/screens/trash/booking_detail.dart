// import 'package:beyride/model/vehicle.dart';
// import 'package:beyride/screens/reservation.dart';
// import 'package:feather_icons/feather_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// class BookingDetail extends StatefulWidget {
//   BookingDetail({super.key, required this.vehicle});

//   final Vehicle vehicle;

//   @override
//   State<BookingDetail> createState() => _BookingDetailState();
// }

// class _BookingDetailState extends State<BookingDetail> {
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final Map<String, dynamic> data = {};

//   String dateText = 'Date';

//   String timeText = 'Time';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         toolbarHeight: 70,
//         title: Text(
//           "Booking Detail",
//           style: GoogleFonts.inter(
//             fontWeight: FontWeight.w500,
//             fontSize: 20,
//             color: Colors.black,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(Icons.arrow_back_ios_new),
//           color: Colors.black,
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   "Selected Vehicle",
//                   style: GoogleFonts.inter(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       child: Image(
//                           height: 120,
//                           image: NetworkImage(widget.vehicle.image)),
//                     ),
//                     const SizedBox(
//                       width: 26,
//                     ),
//                     Flexible(
//                         child: SizedBox(
//                       width: double.infinity,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.vehicle.name,
//                             style: GoogleFonts.inter(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 18,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text(
//                             "Up to ${widget.vehicle.capacity} Seats",
//                             style: GoogleFonts.inter(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14,
//                               color: Colors.grey.shade700,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Text(
//                   "For When?",
//                   style: GoogleFonts.inter(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: const Color.fromRGBO(248, 248, 248, 1),
//                         ),
//                         child: MaterialButton(
//                           onPressed: () async {
//                             final pickedDate = await showDatePicker(
//                                 context: context,
//                                 initialDate: DateTime.now(),
//                                 firstDate: DateTime(2020),
//                                 lastDate: DateTime(2030));
//                             setState(() {
//                               dateText = DateFormat.yMEd().format(pickedDate!);
//                             });
//                             data['date'] = pickedDate.toString();
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               // if (dateText == "Date")
//                               const Icon(
//                                 FeatherIcons.calendar,
//                                 color: Colors.black,
//                                 size: 20,
//                               ),
//                               Text(
//                                 dateText,
//                                 style: GoogleFonts.inter(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Flexible(
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: const Color.fromRGBO(248, 248, 248, 1),
//                         ),
//                         child: MaterialButton(
//                           padding: EdgeInsets.zero,
//                           onPressed: () async {
//                             final pickedTime = await showTimePicker(
//                               context: context,
//                               initialTime: TimeOfDay.now(),

//                               // initialDate: DateTime.now(),
//                               // firstDate: DateTime(2020),
//                               // lastDate: DateTime(2030)
//                             );
//                             setState(() {
//                               timeText = pickedTime!.format(context);
//                             });
//                             data['time'] = pickedTime!.format(context);
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               // if (timeText == 'Time')
//                               const Icon(
//                                 FeatherIcons.clock,
//                                 color: Colors.black,
//                                 size: 20,
//                               ),
//                               Text(
//                                 timeText,
//                                 style: GoogleFonts.inter(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Text(
//                   "Passenger Detail",
//                   style: GoogleFonts.inter(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       child: TextFormField(
//                         onSaved: (newValue) {
//                           data['first_name'] = newValue;
//                         },
//                         decoration: InputDecoration(
//                             fillColor: const Color.fromRGBO(248, 248, 248, 1),
//                             filled: true,
//                             hintText: "First Name",
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: BorderSide.none)),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Flexible(
//                       child: TextFormField(
//                         onSaved: (newValue) {
//                           data['last_name'] = newValue;
//                         },
//                         decoration: InputDecoration(
//                             fillColor: const Color.fromRGBO(248, 248, 248, 1),
//                             filled: true,
//                             hintText: "Last Name",
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: BorderSide.none)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   onSaved: (newValue) {
//                     data['phone_number'] = newValue;
//                   },
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     fillColor: const Color.fromRGBO(248, 248, 248, 1),
//                     filled: true,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide.none),
//                     hintText: "Phone Number",
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   onSaved: (newValue) {
//                     data['email'] = newValue;
//                   },
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                       fillColor: const Color.fromRGBO(248, 248, 248, 1),
//                       filled: true,
//                       hintText: "Email",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide.none)),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                     height: 50,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all(
//                                 const Color.fromRGBO(88, 146, 183, 1))),
//                         onPressed: () {
//                           _formKey.currentState!.save();

//                           Get.to(Reservation(
//                             data: data,
//                             vehicle: widget.vehicle,
//                           ));
//                         },
//                         child: Text(
//                           "Continue",
//                           style: GoogleFonts.inter(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         )))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
