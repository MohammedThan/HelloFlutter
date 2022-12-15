import 'package:flutter/material.dart';
import 'package:hello/widgets/backbutton.dart';
import 'package:hello/widgets/formfield.dart';
import 'package:hexcolor/hexcolor.dart';

class sendpack extends StatelessWidget {
  const sendpack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: HexColor('F1F6F5'),
      child: Stack(
        children: [
          const Positioned(
            top: 40,
            left: 15,
            child: backbutton(),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Image.asset(
              'assets/png/logo-no-background.png',
              scale: 8.5,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                formField(
                  borderColor: HexColor('472183'),
                  borderWidth: 2,
                  icon: Icon(Icons.person, color: HexColor('472183')),
                  hint: 'Reciver name',
                  textcolor: HexColor('472183'),
                  width: 350,
                  filled: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                formField(
                  borderColor: HexColor('472183'),
                  borderWidth: 2,
                  icon: Icon(Icons.monitor_weight, color: HexColor('472183')),
                  hint: 'Weight',
                  textcolor: HexColor('472183'),
                  width: 350,
                  filled: true,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
