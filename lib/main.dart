import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/bloc/products/product_event.dart';
import 'package:pos/data/repositories/devo_products_repository.dart';
import 'package:pos/pages/home_page.dart';

import 'bloc/products/product_bloc.dart';
import 'domain/repositories/products_repository.dart';

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductsRepository>(
          create: (context) => DevoProductsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (BuildContext context) => ProductBloc(
              productRepository: context.read(),
            )..add(ProductsFetched()),
          ),
        ],
        child: MaterialApp(
          theme: getThemeData,
          home: MaterialApp(
            theme: getThemeData,
            home: const HomePage(),
          ),
        ),
      ),
    );
  }
}
