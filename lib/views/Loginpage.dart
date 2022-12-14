import 'package:flutter/material.dart';
import 'package:hello/views/navagationpage.dart';
import 'package:hello/widgets/formfield.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

import '../widgets/backbutton.dart';
import '../widgets/button.dart';

import 'package:hello/backend/DataBase.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                  Lottie.asset('assets/login.json'),
                  formField(
                    borderColor: HexColor('472183'),
                    borderWidth: 2,
                    icon: Icon(Icons.email_outlined, color: HexColor('472183')),
                    hint: 'Email',
                    textcolor: HexColor('472183'),
                    keyboardType: TextInputType.emailAddress,
                    width: 350,
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  formField(
                    controller: passwordController,
                    textcolor: HexColor('472183'),
                    borderColor: HexColor('472183'),
                    borderWidth: 2,
                    icon: Icon(
                      Icons.lock_outline,
                      color: HexColor('472183'),
                    ),
                    hint: 'Password',
                    width: 350,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                    fontSize: 20,
                    height: 40,
                    icon: Icon(
                      Icons.login_outlined,
                      color: HexColor('F1F6F5'),
                      size: 20,
                    ),
                    onPressed: () async {
                      await DataBase().signIn(emailController.text.trim(),
                          passwordController.text.trim().toString());

                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const navgtion();
                      }));
                    },
                    width: 150,
                    text: 'Login',
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
