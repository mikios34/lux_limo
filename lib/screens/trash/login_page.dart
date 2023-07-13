import 'package:beyride/screens/trash/home.dart';
import 'package:beyride/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Column(children: [
            SizedBox(
              height: kToolbarHeight,
            ),
            SizedBox(
              height: 70,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                  height: 100,
                  width: 100,
                  image: AssetImage('assets/images/lux.png')),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "LUX Limo",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.black),
            ),
            Text(
              "Ride with your favourite Luxury vehicle",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              decoration: InputDecoration(
                  isDense: true, // Added this
                  hintText: "Email or Username",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 0.3, color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 0.3, color: Colors.grey))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              decoration: InputDecoration(
                  isDense: true, // Added this
                  hintText: "Password",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 0.3, color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 0.3, color: Colors.grey))),
            ),
            SizedBox(
              height: 50,
            ),
            Text.rich(
              TextSpan(
                text: "By Login you agree to our terms ",
                style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 10),
                // children: [
                //   TextSpan(
                //       text: "TERMS and Conditions",
                //       style: GoogleFonts.inter(
                //           fontStyle: FontStyle.normal,
                //           fontWeight: FontWeight.w400,
                //           color: const Color.fromRGBO(
                //               53, 60, 236, 1),
                //           fontSize: 10))
                // ]
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color.fromRGBO(88, 146, 183, 1)),
                onPressed: () {
                  Get.to(HomePage());
                },
                child: Text("Login",
                    style: GoogleFonts.inter(
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white))),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text("Forget Password?",
                    style: GoogleFonts.inter(
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(41, 66, 156, 1))))
          ]),
        ),
      ),
    );
  }
}
