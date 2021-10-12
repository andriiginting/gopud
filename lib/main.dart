import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';
import 'package:restaurant_app/resto/detail_restaurant.dart';
import 'package:restaurant_app/resto/list_restaurant_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gopud App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: ListRestaurantPage.routeName,
      routes: {
        ListRestaurantPage.routeName: (context) => ListRestaurantPage(),

      },
    );
  }
}
