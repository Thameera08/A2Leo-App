import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:leomd/components/mainCards.dart';
import 'package:leomd/components/mainCardsv2.dart';
import 'package:leomd/screens/dashboard_screens/clubs_screen.dart';
import 'package:leomd/screens/dashboard_screens/leomap.dart';
import 'package:leomd/themes/themes.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> _carouselImages = [
    'lib/images/c1.jpg',
    'lib/images/c2.jpg',
    'lib/images/c3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive adjustments
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                // Carousel Slider
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: CarouselSlider(
                    items: _carouselImages.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              imagePath,
                              width: screenWidth * 0.9,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: screenHeight * 0.25,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Main Card for District President Logo
                MainCardV2(
                  title: 'District President Logo',
                  onTap: () {},
                  img: AssetImage('lib/images/dplogo.png'),
                ),
                SizedBox(height: screenHeight * 0.03),
                // Row of two Dashboard items
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DashboardItem(
                        title: "MD LEO MAP",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MapScreen(),
                            ),
                          );
                        },
                        img: AssetImage('lib/images/leomap.png'),
                      ),
                      DashboardItem(
                        title: "REGION & ZONE",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Clubs(),
                            ),
                          );
                        },
                        img: AssetImage('lib/images/RZ.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                // Main Card for A2 Year Plan
                MainCardV2(
                  title: 'A2 Year Plan',
                  onTap: () {},
                  img: AssetImage('lib/images/yearplan.png'),
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
