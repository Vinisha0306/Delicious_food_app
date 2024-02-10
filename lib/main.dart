import 'package:flutter/material.dart';
import 'package:delicious_food_app/utils/routes_utils.dart';
import 'package:delicious_food_app/views/screens/home_page.dart';
import 'package:delicious_food_app/views/screens/detail_page.dart';
import 'package:delicious_food_app/views/screens/diet_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: 'home_page',
      routes: {
        MyRoutes.HomePage: (context) => HomePage(),
        MyRoutes.detailPage: (context) => DetailPage(),
        MyRoutes.dietPage: (context) => DietPage(),
      },
    );
  }
}
