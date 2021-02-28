import 'package:flutter/material.dart';
import 'package:spotiamigos/screens/home_screen.dart';
import 'package:spotiamigos/utils/RoutesUtils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotiamigos',
      initialRoute: RoutesUtils.HOME,
      routes: {
        RoutesUtils.HOME: (context) => HomeScreen(),
      },
    );
  }
}
