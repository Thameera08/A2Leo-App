// ignore_for_file: prefer_const_constructors, prefer_final_fields, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leomd/screens/a2teams.dart';
import 'package:leomd/screens/homescreen.dart';
import 'package:leomd/screens/multiplescreen.dart';
import 'package:leomd/themes/themes.dart';

class FinalPage extends StatefulWidget {
  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  int _selectedIndex = 2;

  static final List<Widget> _widgetOptions = <Widget>[
    Multiple(),
    A2teams(),
    Homescreen(),
    Text('General',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    Text('Docs', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: SizedBox(
        width: 70, // Set the width of the button
        height: 70, // Set the height of the button
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: AppColors.white,
          child: SvgPicture.asset(
            'lib/images/home.svg',
            width: 40,
            height: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_alt_outlined,
              size: 30,
            ),
            label: 'Multiple',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 30,
            ),
            label: 'A2 Teams',
          ),
          // Spacer item
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // An empty widget
            label: '', // No label for spacing
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lightbulb,
              size: 30,
            ),
            label: 'General',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.folder,
              size: 30,
            ),
            label: 'Documents',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary4,
        unselectedItemColor: AppColors.white,
        backgroundColor: AppColors.primary1,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
