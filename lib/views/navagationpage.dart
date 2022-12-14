import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello/views/Settingspage.dart';
import 'package:hello/views/homepage.dart';
import 'package:hexcolor/hexcolor.dart';

class navgtion extends StatefulWidget {
  const navgtion({super.key});

  @override
  State<navgtion> createState() => _navgtionState();
}

class _navgtionState extends State<navgtion> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    homepage(),
    settingspage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HexColor('4B56D2'),
        onTap: _onItemTapped,
      ),
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
            _widgetOptions.elementAt(_selectedIndex),
          ],
        ),
      ),
    );
  }
}
