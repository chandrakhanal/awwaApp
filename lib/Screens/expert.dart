import 'package:flutter/material.dart';
import 'web_view.dart';

class ExpertRoute extends StatelessWidget {
  const ExpertRoute({Key? key}) : super(key: key);

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
          home: const AwwaWebPage(
              title: 'Expert Registration',
              url: 'https://awwa.org.in/expert/register'),
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
