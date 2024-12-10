import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leomd/components/mainCards.dart';
import 'package:leomd/components/mainCardsv2.dart';
import 'package:leomd/screens/dashboard_screens/controllers/mutiple.dart';
import 'package:leomd/themes/themes.dart';

class Multiple extends StatelessWidget {
  Multiple({super.key});

  // Inject the controller
  final MultipleController controller = Get.put(MultipleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          'Leo Multiple',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Main card at the top
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainCardV2(
                  title: controller.mainCard["title"]!,
                  onTap: () =>
                      controller.onItemTap(controller.mainCard["title"]!),
                  img: AssetImage(controller.mainCard["imgPath"]!),
                ),
              ],
            ),
          ),
          // Dynamically generated dashboard items in rows
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx(() {
                return Column(
                  children: List.generate(
                    (controller.dashboardItems.length / 2).ceil(),
                    (rowIndex) {
                      final startIndex = rowIndex * 2;
                      final endIndex = startIndex + 2;
                      final itemsRow = controller.dashboardItems.sublist(
                          startIndex,
                          endIndex.clamp(0, controller.dashboardItems.length));

                      return Expanded(
                        child: Row(
                          mainAxisAlignment: itemsRow.length == 1
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.spaceEvenly,
                          children: itemsRow.map((item) {
                            return DashboardItem(
                              title: item["title"]!,
                              onTap: () => controller.onItemTap(item["title"]!),
                              img: AssetImage(item["imgPath"]!),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
