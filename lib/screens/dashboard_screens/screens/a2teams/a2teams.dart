import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leomd/components/mainCards.dart';
import 'package:leomd/screens/dashboard_screens/controllers/a2teams.dart';
import 'package:leomd/themes/themes.dart';

class A2teams extends StatelessWidget {
  A2teams({super.key});

  // Inject the controller
  final A2TeamsController controller = Get.put(A2TeamsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "A2 Leaders",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  // Dynamically create rows for team cards
                  ...List.generate(
                    (controller.teams.length / 2).ceil(),
                    (index) {
                      final startIndex = index * 2;
                      final endIndex = startIndex + 2;
                      final teamRow = controller.teams.sublist(startIndex,
                          endIndex.clamp(0, controller.teams.length));

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: teamRow.map((team) {
                            return DashboardItem(
                              title: team["title"]!,
                              onTap: () =>
                                  controller.onTeamSelected(team["title"]!),
                              img: AssetImage(team["imgPath"]!),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
