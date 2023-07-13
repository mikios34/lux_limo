import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme() {
  return ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      primaryColorDark: const Color.fromRGBO(248, 248, 248, 1),
      primaryColor: const Color.fromRGBO(25, 100, 95, 1),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedItemColor: Colors.black, selectedItemColor: Colors.black),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              minimumSize:
                  MaterialStateProperty.all(const Size(double.infinity, 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> state) =>
                    state.contains(MaterialState.disabled)
                        ? Color.fromRGBO(248, 248, 248, 1)
                        : Colors.black,
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> state) => state.contains(MaterialState.disabled)
                      ? Colors.black
                      : Colors.white),
              textStyle: MaterialStateProperty.all(GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 1.2)))),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> state) =>
                    state.contains(MaterialState.disabled)
                        ? const Color.fromRGBO(248, 248, 248, 1)
                        : null,
              ),
              foregroundColor:
                  MaterialStateProperty.resolveWith<Color>((Set<MaterialState> state) => state.contains(MaterialState.disabled) ? Colors.black : Colors.black),
              textStyle: MaterialStateProperty.all(GoogleFonts.inter(
                fontSize: 15,
                letterSpacing: 0.6,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              )))),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          // textStyle: GoogleFonts.inter(
          //     fontSize: 12,
          //     fontWeight: FontWeight.w300,
          //     fontStyle: FontStyle.normal,
          //     letterSpacing: 0.8,
          //     color: Colors.black),

          hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300, fontStyle: FontStyle.normal, letterSpacing: 0.8, color: Colors.black),
          labelStyle: GoogleFonts.inter(fontSize: 29, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, color: const Color(0xff837d7d)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: // BorderSide.none,
                  BorderSide(
                color: Colors.red.shade900,
                width: 0.1,
              ),
              borderRadius: BorderRadius.circular(5.0)),
          errorBorder: OutlineInputBorder(
              borderSide: // BorderSide.none,
                  const BorderSide(
                color: Color.fromRGBO(25, 100, 95, 1),
                width: 0.1,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              //     const BorderSide(
              //   color: Color.fromRGBO(25, 100, 95, 1),
              //   width: 0.1,
              // ),
              borderRadius: BorderRadius.circular(3.0)),
          disabledBorder: OutlineInputBorder(
              borderSide: // BorderSide.none,
                  const BorderSide(color: Color.fromRGBO(25, 100, 95, 1), width: 0.1),
              borderRadius: BorderRadius.circular(10.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              //     const BorderSide(
              //   color: Color.fromRGBO(25, 100, 95, 1),
              //   width: 0.1,
              // ),
              borderRadius: BorderRadius.circular(3.0)),
          fillColor: const Color.fromRGBO(248, 248, 248, 1),
          filled: false,
          isDense: true,
          focusColor: Colors.black,
          hoverColor: Colors.black // Added this
          ),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          toolbarHeight: 70,
          elevation: 0.4,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 23,
            letterSpacing: 0.6,
            fontWeight: FontWeight.w300,
          )));
}
