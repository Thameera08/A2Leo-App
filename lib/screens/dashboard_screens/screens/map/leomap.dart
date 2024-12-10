import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leomd/screens/dashboard_screens/controllers/map.dart';
import 'package:leomd/themes/themes.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  final MapController controller =
      Get.put(MapController()); // Inject controller

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Organize district keys into rows
    List<List<String>> buttonRows = [];
    final districts = controller.districtImages.keys.toList();
    for (int i = 0; i < districts.length; i += 3) {
      buttonRows.add(districts.skip(i).take(3).toList());
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Leo District Maps',
          style: TextStyle(
            fontSize: screenWidth * 0.05, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Display the selected district image or default map image
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Obx(() {
              return Image.asset(
                controller.getSelectedDistrictImage(),
                width: screenWidth * 0.8,
                height: screenHeight * 0.4,
                fit: BoxFit.contain,
              );
            }),
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
                      controller.selectDistrict(district);
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
