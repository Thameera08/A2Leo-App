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
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          'LEO District 306 A2',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
      elevation: 1,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: SizedBox(
        width: 70, // Set the width of the button
        height: 70, // Set the height of the button
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _selectedIndex =
                  2; // Set this to show the desired screen on FAB press
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: AppColors.primary4,
          child: Icon(Icons.home, size: 30, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              size: 30,
            ),
            label: 'Multiple',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              size: 30,
            ),
            label: 'District Map',
          ),
          // Spacer item
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // An empty widget
            label: '', // No label for spacing
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 30,
            ),
            label: 'Zones & Regions',
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
        unselectedItemColor: AppColors.primary2,
        backgroundColor: AppColors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
