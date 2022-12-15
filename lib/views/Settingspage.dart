import 'package:flutter/material.dart';
import 'package:hello/backend/DataBase.dart';
import 'package:hello/views/startview.dart';
import 'package:hello/views/updateinfo.dart';
import 'package:hello/widgets/button.dart';
import 'package:hexcolor/hexcolor.dart';

class settingspage extends StatelessWidget {
  const settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Button(
            text: "Edit profile",
            icon: Icon(
              Icons.person,
              color: HexColor('F1F6F5'),
            ),
            onPressed: () {Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const updatepage();
              }));},
            height: 60,
            width: 300,
            fontSize: 16,
          ),
          const SizedBox(height: 20),
          Button(
            text: "Logout",
            icon: Icon(
              Icons.arrow_back,
              color: HexColor('F1F6F5'),
            ),
            onPressed: () async {
              DataBase().signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const startview();
              }));
            },
            height: 60,
            width: 300,
            fontSize: 16,
          )
        ],
      ),
    );
  }
}
