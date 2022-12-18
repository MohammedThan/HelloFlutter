import 'package:flutter/material.dart';
import 'package:hello/backend/DataBase.dart';
import 'package:hello/views/addpackagepage.dart';
import 'package:hello/views/homepage.dart';
import 'package:hello/views/modifypackagepage.dart';
import 'package:hello/views/modifyuserpage.dart';
import 'package:hello/views/sendpackage.dart';
import 'package:hello/widgets/backbutton.dart';
import 'package:hello/widgets/button.dart';
import 'package:hello/widgets/formfield.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class adminpage extends StatelessWidget {
  const adminpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Stack(
      children: [
        Positioned(
          top: 40,
          right: 20,
          child: Button(
            height: 40,
            icon: Icon(
              Icons.redo,
              color: HexColor('F1F6F5'),
            ),
            onPressed: () => Navigator.of(context).pop(),
            text: 'Exit Admin Mode',
            width: 180,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/isometric-delivery-box.json', height: 350),
              const SizedBox(
                height: 20,
              ),
              Button(
                height: 60,
                icon: Icon(
                  Icons.add,
                  color: HexColor('F1F6F5'),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const addpackagepage();
                  }));
                },
                text: 'Add New Package',
                width: 300,
                fontSize: 16,
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                height: 60,
                icon: Icon(
                  Icons.edit,
                  color: HexColor('F1F6F5'),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const modifyuserpage();
                  }));
                },
                text: 'Modify User Information',
                width: 300,
                fontSize: 16,
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                height: 60,
                icon: Icon(
                  Icons.edit_note,
                  color: HexColor('F1F6F5'),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const modifypackagepage();
                  }));
                },
                text: 'Modify Package Information',
                width: 300,
                fontSize: 16,
              ),
            ],
          ),
        )
      ],
    );
  }
}
