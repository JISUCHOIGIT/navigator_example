import 'package:flutter/material.dart';
import 'package:navigator_example/screen/home_screens.dart';
import 'package:navigator_example/screen/route_one_screen.dart';
import 'package:navigator_example/screen/route_three_screen.dart';
import 'package:navigator_example/screen/route_two_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      //home: HomeScreen(),
      routes: {
        // route const로 상수값 해놓기
        '/': (context) => HomeScreen(),
        '/one': (context) => RouteOneScreen(),
        '/two': (context) => RouteTwoScreen(),
        '/three': (context) => RouteThreeScreen(),
      },
    ),
  );
}
