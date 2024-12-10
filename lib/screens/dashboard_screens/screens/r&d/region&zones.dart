// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leomd/screens/dashboard_screens/controllers/region&zone.dart';

class RandD extends StatelessWidget {
  RandD({super.key});

  final RandDController controller =
      Get.put(RandDController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.navigateToFinalPage(); // Navigate using the controller
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "A2 Region & Zones",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                "Research & Development",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Add any other widgets here as needed
          ],
        ),
      ),
    );
  }
}
