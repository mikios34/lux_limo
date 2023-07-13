import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kToolbarHeight + 30,
              ),
              Container(
                width: 108,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.asset(
                    "assets/images/lux.png",
                    fit: BoxFit.fill,
                    height: 90,
                    // width: 120,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Lux Limo",
                style: GoogleFonts.inter(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(
                  text: "Thank You, ",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.6,
                  ),
                  children: [
                    TextSpan(
                      text: "Lux Limo",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.06,
                      ),
                    )
                  ])),
              const SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(
                  text: "Reciept Number: ",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.6,
                  ),
                  children: [
                    TextSpan(
                      text: "1234",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.06,
                      ),
                    )
                  ])),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 2,
                      child: SizedBox(
                          width: double.infinity, child: Text("Place Holder"))
                      // Image.network(width: double.infinity, 'src')

                      ),
                  SizedBox(
                    width: 13,
                  ),
                  Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vehcile Name",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.06,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Vehicle Make",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.06,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(
                  text: "From : ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.06,
                  ),
                  children: [
                    TextSpan(
                      text: "placeeeeeee name ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.06,
                      ),
                    )
                  ])),
              const SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(
                  text: "To : ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.06,
                  ),
                  children: [
                    TextSpan(
                      text: "placeeeeeee name ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.06,
                      ),
                    )
                  ])),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(
                  text: "Pickup Date : ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.06,
                  ),
                  children: [
                    TextSpan(
                      text: "placeeeeeee name ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.06,
                      ),
                    )
                  ])),
              const SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(
                  text: "Pickup Time : ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.06,
                  ),
                  children: [
                    TextSpan(
                      text: "placeeeeeee name ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.06,
                      ),
                    )
                  ])),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(
                  text: "Paid Date : ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.06,
                  ),
                  children: [
                    TextSpan(
                      text: "placeeeeeee name ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.06,
                      ),
                    )
                  ])),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(
                  text: "Paid Time : ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.06,
                  ),
                  children: [
                    TextSpan(
                      text: "placeeeeeee name ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.06,
                      ),
                    )
                  ])),
              const SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(
                  text: "Payment : ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.06,
                  ),
                  children: [
                    TextSpan(
                      text: "placeeeeeee name ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.06,
                      ),
                    )
                  ])),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Subtotal : \$5345",
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.06,
                    color: Colors.grey.shade600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Tax : \$53",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.06,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(
                  text: "Total : ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.06,
                  ),
                  children: [
                    TextSpan(
                      text: "placeeeeeee name ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.06,
                      ),
                    )
                  ])),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
