import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  ThemeData get getThemeData {
    final textColor = Colors.white;
    final backgroundColor = Color(0xff021139);
    final accentColor = Color(0xff283758);
    return ThemeData(
      primarySwatch: Colors.indigo,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: backgroundColor,
      errorColor: Color(0xffFF3B30),
      accentColor: accentColor,
      iconTheme: IconThemeData(color: Colors.white, size: 28),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        bodyText1: TextStyle(
            fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontSize: 14, color: textColor),
        headline4: TextStyle(fontSize: 22, color: textColor),
        headline3: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: textColor),
        headline2: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 28, color: textColor),
        headline1: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 52, color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData,
      home: MaterialApp(
        theme: getThemeData,
        home: const HomePage(),
      ),
    );
  }
}
