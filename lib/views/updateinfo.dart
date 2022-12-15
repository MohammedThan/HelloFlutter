import 'package:flutter/material.dart';
import 'package:hello/backend/DataBase.dart';
import 'package:hello/widgets/button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

import '../widgets/backbutton.dart';
import '../widgets/formfield.dart';

class updatepage extends StatelessWidget {
  const updatepage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController locationController = TextEditingController();
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
                Lottie.asset('assets/update.json'),
                formField(
                  borderColor: HexColor('472183'),
                  borderWidth: 2,
                  icon: Icon(Icons.person, color: HexColor('472183')),
                  hint: 'Name',
                  textcolor: HexColor('472183'),
                  width: 350,
                  filled: true,
                  controller: nameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                formField(
                  borderColor: HexColor('472183'),
                  borderWidth: 2,
                  icon: Icon(Icons.location_city_rounded,
                      color: HexColor('472183')),
                  hint: 'Location',
                  textcolor: HexColor('472183'),
                  width: 350,
                  filled: true,
                  keyboardType: TextInputType.text,
                  controller: locationController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Button(
                    text: 'Update',
                    icon: Icon(
                      Icons.upload,
                      color: HexColor('F1F6F5'),
                    ),
                    onPressed: () {
                      DataBase().updateuserinfo(nameController.text.trim(),
                          locationController.text.trim());
                      Navigator.of(context).pop();
                    },
                    height: 60,
                    width: 200)
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
