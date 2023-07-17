import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({super.key, required this.refetch});

  var refetch;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const Image(
            //   image: AssetImage('assets/connection_error.png'),
            // ),

            SizedBox(
                height: 250,
                child: LottieBuilder.asset("assets/connect_lottie.json")),
            const SizedBox(
              height: 20,
            ),
            Text(
              "It seems there is a weak connection, please retry.".tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,

              // style: GoogleFonts.inter(
              //   fontStyle: FontStyle.normal,
              //   fontSize: 25,
              //   fontWeight: FontWeight.w600,
              //   color: Colors.black,
              // ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(width: 0.2),
                          borderRadius: BorderRadius.circular(5)))),
                  onPressed: () {
                    refetch();
                  },
                  child: Text(
                    "Try Again".tr,
                    style: GoogleFonts.inter(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
