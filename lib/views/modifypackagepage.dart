import 'package:flutter/material.dart';
import 'package:hello/backend/DataBase.dart';
import 'package:hello/widgets/button.dart';
import 'package:hello/widgets/formfield.dart';
import 'package:hello/widgets/groupbutton.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

import '../widgets/backbutton.dart';

class modifypackagepage extends StatelessWidget {
  const modifypackagepage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController trackNumController = TextEditingController();
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
              child:
                  Image.asset('assets/png/logo-no-background.png', scale: 8.5),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/register.json', height: 300),
                  formField(
                    controller: trackNumController,
                    borderColor: HexColor('472183'),
                    borderWidth: 2,
                    icon: Icon(Icons.location_searching_rounded,
                        color: HexColor('472183')),
                    hint: 'Package Track Number',
                    textcolor: HexColor('472183'),
                    keyboardType: TextInputType.number,
                    width: 350,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  formField(
                    textcolor: HexColor('472183'),
                    borderColor: HexColor('472183'),
                    borderWidth: 2,
                    icon: Icon(
                      Icons.person_outline,
                      color: HexColor('472183'),
                    ),
                    hint: 'Edit Reciver Name',
                    keyboardType: TextInputType.name,
                    width: 350,
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  formField(
                    controller: locationController,
                    textcolor: HexColor('472183'),
                    borderColor: HexColor('472183'),
                    borderWidth: 2,
                    icon: Icon(
                      Icons.location_city_rounded,
                      color: HexColor('472183'),
                    ),
                    hint: 'Edit Reciver Location',
                    keyboardType: TextInputType.phone,
                    width: 350,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Expanded(
                        child: Row(
                      children: [
                        GroupButton(
                            text: 'Processing',
                            icon: Icon(
                              Icons.edit_note,
                              color: HexColor('F1F6F5'),
                            ),
                            onPressed: () {},
                            height: 50,
                            width: 150),
                        const SizedBox(
                          width: 10,
                        ),
                        GroupButton(
                            text: 'Shipped',
                            icon: Icon(
                              Icons.flight,
                              color: HexColor('F1F6F5'),
                            ),
                            onPressed: () {},
                            height: 50,
                            width: 150),
                        const SizedBox(
                          width: 10,
                        ),
                        GroupButton(
                            text: 'In Transit',
                            icon: Icon(
                              Icons.delivery_dining,
                              color: HexColor('F1F6F5'),
                            ),
                            onPressed: () {},
                            height: 50,
                            width: 150),
                        const SizedBox(
                          width: 10,
                        ),
                        GroupButton(
                            text: 'Delivered',
                            icon: Icon(
                              Icons.home,
                              color: HexColor('F1F6F5'),
                            ),
                            onPressed: () {},
                            height: 50,
                            width: 150),
                      ],
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                    text: 'Edit & Save',
                    fontSize: 20,
                    width: 250,
                    height: 50,
                    onPressed: () {
                      // DataBase().signUp(
                      //     emailController.text.trim(),
                      //     trackNumController.text.trim(),
                      //     nameController.text.trim(),
                      //     locationController.text.trim());
                      // Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.save,
                      color: HexColor('F1F6F5'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
