import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class formField extends StatefulWidget {
  TextEditingController? controller;
  Icon? icon;
  String? hint;
  bool filled;
  bool obscureText;
  double? width;
  String font = "Lekton";
  Color textcolor;
  Color? fillColor;
  Color borderColor = HexColor('295579');
  TextInputType? keyboardType;
  double borderWidth;
  String? Function(String?)? validator;

  formField(
      {super.key,
      this.controller,
      this.icon,
      this.hint,
      this.width,
      this.obscureText = false,
      this.filled = false,
      this.textcolor = Colors.white,
      this.fillColor,
      required this.borderColor,
      this.keyboardType,
      this.borderWidth = 2.0,
      this.validator});

  @override
  State<formField> createState() => _formFieldState();
}

class _formFieldState extends State<formField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        obscureText: widget.obscureText,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        cursorColor: widget.textcolor,
        style: TextStyle(color: widget.textcolor, fontFamily: widget.font),
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor, width: widget.borderWidth),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusColor: widget.textcolor,
          hintStyle:
              TextStyle(color: widget.textcolor, fontFamily: widget.font),
          filled: widget.filled,
          fillColor: widget.fillColor,
          prefixIcon: widget.icon,
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
