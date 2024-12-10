import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leomd/components/club_card.dart';
import 'package:leomd/screens/dashboard_screens/controllers/club.dart';
import 'package:leomd/themes/themes.dart';

class LeoClubs extends StatelessWidget {
  LeoClubs({super.key});

  // Inject the controller
  final LeoClubsController controller = Get.put(LeoClubsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "Leo Clubs",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Obx(() {
          if (controller.clubs.isEmpty) {
            return Center(
              child: Text(
                'No clubs available.',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.clubs.length,
            itemBuilder: (context, index) {
              final club = controller.clubs[index];
              return ClubCard(
                title: club["title"]!,
                onTap: () {
                  controller
                      .onClubTap(club["title"]!); // Call the controller method
                },
                iconPath: club["iconPath"]!,
              );
            },
          );
        }),
      ),
    );
  }
}
