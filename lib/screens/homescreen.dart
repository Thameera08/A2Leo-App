import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leomd/components/mainCards.dart';
import 'package:leomd/components/mainCardsv2.dart';
import 'package:leomd/screens/dashboard_screens/screens/dplogo/dplogo.dart';
import 'package:leomd/screens/dashboard_screens/screens/r&d/region&zones.dart';
import 'package:leomd/screens/dashboard_screens/screens/map/leomap.dart';
import 'package:leomd/screens/dashboard_screens/screens/yearplan/yearplan.dart';
import 'package:leomd/themes/themes.dart';

class Homescreen extends StatelessWidget {
   Homescreen({super.key});



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Header with logo and icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.02),
                    child: Image.asset(
                      'lib/images/leoslogo.png',
                      width: screenWidth * 0.3,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          Get.snackbar(
                            'Notifications',
                            'No new notifications!',
                            snackPosition: SnackPosition.TOP,
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          Get.bottomSheet(
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: Text('Option 1'),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text('Option 2'),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text('Close'),
                                    onTap: () => Get.back(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
     
              SizedBox(height: screenHeight * 0.02),
              // Main Card for District President Logo
              Expanded(
                flex: 2,
                child: MainCardV2(
                  title: "District President's Logo",
                  onTap: () {
                    Get.to(() => DPLogoPage());
                  },
                  img: AssetImage('lib/images/dplogo.png'),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Row of two Dashboard items
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DashboardItem(
                          title: "Leo MD Map",
                          onTap: () {
                            Get.to(() => MapScreen());
                          },
                          img: AssetImage('lib/images/map.png'),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: DashboardItem(
                          title: "Regions & Zones",
                          onTap: () {
                            Get.to(() => RandD());
                          },
                          img: AssetImage('lib/images/RZ.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Main Card for A2 Year Plan
              Expanded(
                flex: 2,
                child: MainCardV2(
                  title: 'A2 Year Plan',
                  onTap: () {
                    Get.off(() => YearPlanPage());
                  },
                  img: AssetImage('lib/images/calender.png'),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
