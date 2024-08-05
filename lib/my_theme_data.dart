import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData{
static Color primaryColor=Color(0xffB7935F);
static Color primaryDarkColor=Color(0xff141A2E);
static Color whiteColor=Color(0xffF8F8F8);
static Color blackColor=Color(0xff242424);
static Color yellowColor=Color(0xffFACC1D);

  static ThemeData lightTheme=ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      dividerTheme: DividerThemeData(
        color: primaryColor
      ),
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          size: 30,
          color: blackColor
        ),
        titleTextStyle: GoogleFonts.elMessiri(
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: blackColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
  ),
     textTheme: TextTheme(
       bodyLarge: GoogleFonts.elMessiri(
         textStyle: TextStyle(
             fontSize: 30,
             fontWeight: FontWeight.w700,
             color: blackColor
         ),
    ),
       bodyMedium: GoogleFonts.elMessiri(
         textStyle: TextStyle(
             fontSize: 25,
             fontWeight: FontWeight.w600,
             color: blackColor
         ),
       ),
       bodySmall: GoogleFonts.inter(
           textStyle: TextStyle(
               fontSize: 25,
               fontWeight: FontWeight.w400,
               color: blackColor
           )
       ),
       labelSmall: GoogleFonts.inter(
         textStyle: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.w400,
             color: blackColor
         ),
       ),
     ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: blackColor,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
    )
  );





  static ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      dividerTheme: DividerThemeData(
          color: primaryDarkColor
      ),
      primaryColor: primaryDarkColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            size: 30,
            color: whiteColor
        ),
        titleTextStyle: GoogleFonts.elMessiri(
          textStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: whiteColor
          ),
        ),
        bodyMedium: GoogleFonts.elMessiri(
          textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: whiteColor
          ),
        ),
        bodySmall: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: whiteColor
            ),
        ),
        labelSmall: GoogleFonts.inter(
          textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: yellowColor
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryDarkColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: yellowColor,
        unselectedItemColor: whiteColor,
        type: BottomNavigationBarType.fixed,
      )
  );
}
