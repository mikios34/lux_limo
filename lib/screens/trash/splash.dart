import 'package:beyride/screens/home/home_page.dart';
import 'package:beyride/screens/search_reservation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.center,
                    begin: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black]),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/home.jpg"))),
            width: double.infinity,
            height: double.infinity,
            // child: Image(
            //     fit: BoxFit.fill,
            //     image: AssetImage("assets/images/home.jpg"))
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 350.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.center,
                      colors: [
                        Colors.black,
                        Colors.grey.withOpacity(0.0),
                      ],
                      stops: [
                        2.0,
                        0.0
                      ])),
            ),
          ),
          Positioned(
              top: 120,
              left: 30,
              right: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Luxury Chauffeured Transport",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 33,
                        color: Colors.white),
                  ),
                  Text(
                    "Ride with your favourite vehicle",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.white),
                  )
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            //
// rgba(169, 194, 209, 1)
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(169, 194, 209, 1))),
                        onPressed: () {
                          Get.to(HomePage());
                        },
                        child: Text(
                          "Reserve Ride",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      side: const BorderSide(
                                          color: Colors.white, width: 0.1))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white.withOpacity(0.1)),
                        ),
                        onPressed: () {
                          Get.to(const SearchResrvation());
                        },
                        child: Text(
                          "Track Reservation",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have Account?",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: const Color.fromRGBO(211, 201, 201, 1)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(LoginPage());
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
