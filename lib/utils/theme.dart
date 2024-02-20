import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ott_app/styles/text_styles.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  textTheme: GoogleFonts.openSansTextTheme(),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    titleTextStyle: CustomTextStyle.mediumText.style,
    actionsIconTheme: const IconThemeData(color: Colors.white),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(Colors.white),
    ),
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(Colors.white),
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStatePropertyAll(EdgeInsets.all(18)),
      foregroundColor: MaterialStatePropertyAll(Colors.white),
      backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ),
  ),
);
