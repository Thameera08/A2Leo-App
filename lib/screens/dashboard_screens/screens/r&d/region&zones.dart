// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leomd/components/zone_card.dart';
import 'package:leomd/screens/dashboard_screens/controllers/region&zone.dart';
import 'package:leomd/themes/themes.dart';

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
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
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
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.itemCount.value,
                  itemBuilder: (context, index) {
                    return ZoneCard(
                      title: 'Zone A${index + 1}',
                      imageUrl: AssetImage('lib/images/dplogo.png'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
