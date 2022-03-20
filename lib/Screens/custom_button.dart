import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 192, 3, 120);

class CustomButton extends StatelessWidget {
  final String inputText;
  final GestureTapCallback onPressed;
  final double height;
  final Icon bIcon;
  get borderRadius => BorderRadius.circular(8.0);

  const CustomButton(
      {required this.inputText,
      required this.onPressed,
      required this.height,
      required this.bIcon});

  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.pink,
      splashColor: Colors.pink.shade200,
      /*child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.face,
              color: Colors.white,
            ),
            SizedBox(
              width: 100.0,
              height: 100.0,
            ),
            Text(
              "Tap Me",
              maxLines: 1,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),*/

      child: Material(
        elevation: 6,
        borderRadius: borderRadius,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.all(0.0),
            height: height, //MediaQuery.of(context).size.width * .08,
            width: 280.0, //MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Row(
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  print(constraints);
                  return Container(
                      height: constraints.maxHeight,
                      width: constraints.maxHeight,
                      decoration: BoxDecoration(
                        color: Colors.pink[400],
                        borderRadius: borderRadius,
                      ),
                      child: bIcon);
                }),
                Expanded(
                  child: Text(
                    inputText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
