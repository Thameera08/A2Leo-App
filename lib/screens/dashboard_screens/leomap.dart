// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:leomd/themes/themes.dart';
import 'package:leomd/widgets/nav_bar.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String? _selectedDistrict;

  final Map<String, String> districtImages = {
    'a1': 'lib/images/maps/a1.png',
    'a2': 'lib/images/maps/a2.png',
    'b1': 'lib/images/maps/b1.png',
    'b2': 'lib/images/maps/b2.png',
    'c1': 'lib/images/maps/c1.png',
    'c2': 'lib/images/maps/c2.png',
  };

  final String defaultMapImage = 'lib/images/maps/all.png'; // Default full map image

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive adjustments
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Organize district keys into rows
    List<List<String>> buttonRows = [];
    for (int i = 0; i < districtImages.keys.length; i += 3) {
      buttonRows.add(districtImages.keys.skip(i).take(3).toList());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Leo District Maps',
          style: TextStyle(
            color: Colors.black,
            fontSize: screenWidth * 0.05, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => FinalPage(),
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Display the selected district image or default map image
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Image.asset(
              _selectedDistrict != null
                  ? districtImages[_selectedDistrict]!
                  : defaultMapImage,
              width: screenWidth * 0.8,
              height: screenHeight * 0.4,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          // Display rows of district buttons
          ...buttonRows.map(
            (row) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: row.map((district) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDistrict = district;
                      });
                    },
                    child: Container(
                      width: screenWidth * 0.15,
                      height: screenWidth * 0.15,
                      decoration: BoxDecoration(
                        color: AppColors.primary1,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          district.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
