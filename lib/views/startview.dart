import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

import '../widgets/button.dart';

class startview extends StatelessWidget {
  const startview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor('F1F6F5'),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 20,
              child:
                  Image.asset('assets/png/logo-no-background.png', scale: 8.5),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    items: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/delivery-concept.json'),
                          const Text(
                            'Welcome to K-delivery!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lekton',
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/isometric-delivery-box.json'),
                          const Text(
                            'Where your packges are in safe hands...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lekton',
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Lottie.asset('assets/door-delivery.json'),
                          SizedBox(
                            height: 70,
                          ),
                          const Text(
                            '...and delivered to your door!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lekton',
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      height: 600.0,
                      enableInfiniteScroll: true,
                    ),
                  ),
                  Button(
                    fontSize: 29,
                    height: 50,
                    icon: Icon(
                      Icons.login_outlined,
                      color: HexColor('F1F6F5'),
                    ),
                    onPressed: () {},
                    width: 200,
                    text: 'Login',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                        const TextSpan(text: "Don't have an account?\t "),
                        TextSpan(
                            text: "Sign up",
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Entering sign up page');
                              })
                      ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
