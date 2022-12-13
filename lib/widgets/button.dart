import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Button extends StatelessWidget {
  String text;
  Icon icon;
  double width;
  double height;
  double fontSize;
  Function()? onPressed;
  Button(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed,
      required this.height,
      required this.width,
      this.fontSize = 16.0});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontFamily: 'Lekton', fontSize: this.fontSize);
    final borderRadius = BorderRadius.all(Radius.circular(10));
    return Material(
      elevation: 10,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: this.onPressed,
        child: Container(
          padding: EdgeInsets.all(0.0),
          height: this.height, //MediaQuery.of(context).size.width * .08,
          width: this.width, //MediaQuery.of(context).size.width * .3,
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
                      color: HexColor('4B56D2'), borderRadius: borderRadius),
                  child: this.icon,
                );
              }),
              Expanded(
                child: Text(
                  this.text,
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
