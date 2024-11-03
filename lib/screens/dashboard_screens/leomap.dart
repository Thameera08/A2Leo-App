import 'package:flutter/material.dart';
import 'package:leomd/screens/homescreen.dart';
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

  final String defaultMapImage =
      'lib/images/maps/all.png'; // Default full map image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leo District Maps',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => FinalPage(),
              ),
            );
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Display the selected district image or default map image
          Image.asset(
            width: 300,
            _selectedDistrict != null
                ? districtImages[_selectedDistrict]!
                : defaultMapImage,
          ),
          // Row of buttons in a horizontal scrollable list
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: districtImages.keys.map((district) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDistrict = district;
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.primary1,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      district.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
