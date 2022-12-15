import 'package:flutter/material.dart';
import 'package:hello/widgets/backbutton.dart';
import 'package:hello/widgets/button.dart';
import 'package:hello/widgets/formfield.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hello/backend/DataBase.dart';

class sendpack extends StatelessWidget {
  const sendpack({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController destinationController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController paymentController = TextEditingController();
    TextEditingController insuranceController = TextEditingController();
    TextEditingController diamensionController = TextEditingController();
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
                  controller: nameController,
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
                  keyboardType: TextInputType.number,
                  controller: weightController,
                ),
                const SizedBox(
                  height: 20,
                ),
                formField(
                  borderColor: HexColor('472183'),
                  borderWidth: 2,
                  icon: Icon(Icons.location_on, color: HexColor('472183')),
                  hint: 'Destination',
                  textcolor: HexColor('472183'),
                  width: 350,
                  filled: true,
                  controller: destinationController,
                ),
                const SizedBox(
                  height: 20,
                ),
                formField(
                  borderColor: HexColor('472183'),
                  borderWidth: 2,
                  icon: Icon(Icons.date_range, color: HexColor('472183')),
                  hint: 'Final delivery date',
                  textcolor: HexColor('472183'),
                  width: 350,
                  filled: true,
                  keyboardType: TextInputType.datetime,
                  controller: dateController,
                ),
                const SizedBox(
                  height: 20,
                ),
                formField(
                  borderColor: HexColor('472183'),
                  borderWidth: 2,
                  icon: Icon(Icons.money, color: HexColor('472183')),
                  hint: 'Payment',
                  textcolor: HexColor('472183'),
                  width: 350,
                  filled: true,
                  keyboardType: TextInputType.number,
                  controller: paymentController,
                ),
                const SizedBox(
                  height: 20,
                ),
                formField(
                  borderColor: HexColor('472183'),
                  borderWidth: 2,
                  icon: Icon(Icons.money, color: HexColor('472183')),
                  hint: 'Insurance',
                  textcolor: HexColor('472183'),
                  width: 350,
                  filled: true,
                  keyboardType: TextInputType.number,
                  controller: insuranceController,
                ),
                const SizedBox(
                  height: 20,
                ),
                formField(
                  borderColor: HexColor('472183'),
                  borderWidth: 2,
                  icon: Icon(Icons.account_box_outlined,
                      color: HexColor('472183')),
                  hint: 'Dimensions',
                  textcolor: HexColor('472183'),
                  width: 350,
                  filled: true,
                  controller: diamensionController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Button(
                    text: 'Submit',
                    icon: Icon(
                      Icons.upload,
                      color: HexColor('F1F6F5'),
                    ),
                    onPressed: () {
                      // DataBase().addPackage(destinationController.text.trim(),diamensionController,dateController,insuranceController,paymentController,nameController);
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
