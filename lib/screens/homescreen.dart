// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:leomd/components/mainCards.dart';
import 'package:leomd/components/mainCardsv2.dart';
import 'package:leomd/screens/dashboard_screens/clubs_screen.dart';
import 'package:leomd/screens/dashboard_screens/council_screen.dart';
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
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                items: _carouselImages.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          imagePath,
                          width: 350,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardItem(
                    title: "COUNCIL",
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => CouncilScreen(),
                        ),
                      );
                    },
                    icon: Icon(CupertinoIcons.group_solid),
                  ),
                  DashboardItem(
                    title: "CLUBS",
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Clubs(),
                        ),
                      );
                    },
                    icon: Icon(CupertinoIcons.house_fill),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            MainCardV2(title: 'Year Plan', onTap: (){}, icon: Icons.calendar_today),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardItem(
                    title: "LEO MAP",
                    onTap: () {},
                    icon: Icon(CupertinoIcons.map_fill),
                  ),
                  DashboardItem(
                    title: "REGIONS & ZONES",
                    onTap: () {},
                    icon: Icon(CupertinoIcons.location_circle_fill),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
