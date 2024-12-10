import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leomd/screens/dashboard_screens/controllers/yearplan.dart';
import 'package:leomd/themes/themes.dart';



class YearPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final YearPlanController controller = Get.put(YearPlanController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('Year Plan'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.yearPlans.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.yearPlans.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.yearPlans[index]),
            );
          },
        );
      }),
    );
  }
}
