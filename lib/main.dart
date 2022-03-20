import 'package:flutter/material.dart';
import 'package:awwa_app/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const appName = 'AWWA APP';
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        //primaryColor: Colors.lightBlue[800],
        primaryColor: Colors.pinkAccent[200],

        // Define the default font family.
        fontFamily: 'Poppins',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 26.0, fontStyle: FontStyle.normal),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Poppins'),
        ),
      ),
      // home: AnimatedSplash(
      //   imagePath: 'assets/gfg.png',
      //   home: const HomePage(),
      //   customFunction: duringSplash,
      //   duration: 2500,
      //   type: AnimatedSplashType.BackgroundProcess,
      //   outputAndHome: op,
      // ),
      //home: const HomePage(),
      home: awwaSplash(),
    );
  }
}
