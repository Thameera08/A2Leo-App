// ignore_for_file: prefer_const_constructors, prefer_final_fields, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:leomd/screens/a2teams.dart';
import 'package:leomd/screens/homescreen.dart';
import 'package:leomd/screens/multiplescreen.dart';
import 'package:leomd/themes/themes.dart';

class BottomNavBarExample extends StatefulWidget {
  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              size: 30,
            ),
            label: 'MULTIPLE',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              size: 40,
            ),
            label: 'A2 TEAMS',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 40,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              size: 40,
            ),
            label: 'GENERAL',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.description,
              size: 40,
            ),
            label: 'DOCS',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary4,
        backgroundColor: AppColors.primary1,
        unselectedItemColor: AppColors.primary2,
        onTap: _onItemTapped,
      ),
    );
  }
}
