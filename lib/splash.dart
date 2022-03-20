import 'dart:async';
import 'package:flutter/material.dart';
import 'Screens/home_page.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

class awwaSplash extends StatefulWidget {
  @override
  _awwaSplashState createState() => _awwaSplashState();
}

class _awwaSplashState extends State<awwaSplash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.pink[100],
        child: Image.asset(
          'assets/images/AWWALogo.min.png',
        ));
  }
}
