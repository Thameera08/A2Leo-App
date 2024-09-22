// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:leomd/components/mainCards.dart';
import 'package:leomd/components/mainCardsv2.dart';
import 'package:leomd/themes/themes.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary2,
              AppColors.primary3,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'lib/images/dplogo.png',
                    width: 300,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DashboardItem(
                        title: "COUNCIL",
                        onTap: () {},
                        icon: Icon(Icons.group),
                      ),
                      DashboardItem(
                        title: "CLUBS",
                        onTap: () {},
                        icon: Icon(Icons.group),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: MainCardV2(
                    title: "YEAR PLAN",
                    onTap: () {},
                    icon: Icon(Icons.calendar_today),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DashboardItem(
                        title: "LEO MAP",
                        onTap: () {},
                        icon: Icon(Icons.group),
                      ),
                      DashboardItem(
                        title: "REGIONS & ZONES",
                        onTap: () {},
                        icon: Icon(Icons.group),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
