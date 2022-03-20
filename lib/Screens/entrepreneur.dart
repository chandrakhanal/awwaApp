import 'package:flutter/material.dart';
import 'awwa_web_page.dart';

class EntrepreneurRoute extends StatelessWidget {
  const EntrepreneurRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/asha-light.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AwwWebHome(
              title: 'Entrepreneur Registration',
              selectedUrl: 'https://awwa.org.in/entrepreneur/register'),
        ) /* add child content here */,
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Text('Go back!'),
      //   ),
      // ),
    );
  }
}
