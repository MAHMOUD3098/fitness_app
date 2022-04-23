import 'package:fitness_app/modules/onboarding/get_started_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 55.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      home: const GetStartedScreen(),
    );
  }
}
