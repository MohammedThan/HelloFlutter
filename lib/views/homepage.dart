import 'package:flutter/material.dart';
import 'package:hello/views/sendpackage.dart';
import 'package:hello/widgets/button.dart';
import 'package:hello/widgets/formfield.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

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
              Icons.add,
              color: HexColor('F1F6F5'),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const sendpack();
              }));
            },
            text: 'Send package',
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
              formField(
                borderColor: HexColor('472183'),
                borderWidth: 2,
                icon: Icon(Icons.search, color: HexColor('472183')),
                hint: 'Search for a package',
                textcolor: HexColor('472183'),
                width: 350,
                filled: true,
                controller: searchController,
              ),
              const SizedBox(
                height: 50,
              ),
              Button(
                height: 60,
                icon: Icon(
                  Icons.arrow_back,
                  color: HexColor('F1F6F5'),
                ),
                onPressed: () {},
                text: 'Search',
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
