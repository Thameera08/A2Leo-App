import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leomd/components/council_card.dart';
import 'package:leomd/screens/dashboard_screens/controllers/council_controller.dart';
import 'package:leomd/themes/themes.dart';
import 'package:leomd/widgets/nav_bar.dart';

class CouncilScreen extends StatelessWidget {
  CouncilScreen({super.key});

  final CouncilController controller = Get.put(CouncilController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => FinalPage()); // Use GetX navigation
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "A2 Council",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primary1,
          leading: IconButton(
            onPressed: () {
              Get.off(() => FinalPage()); // Use GetX navigation
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                AppColors.primary2,
                AppColors.primary3,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.councilMembers.isEmpty) {
              return Center(
                child: Text(
                  'No council members found.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.count(
                  childAspectRatio: 4.0,
                  crossAxisCount: 1,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  padding: const EdgeInsets.all(16.0),
                  children: controller.councilMembers.map((member) {
                    return CouncilCard(
                      title: member.name, // Use the Council model field
                      onTap: () {
                        // Add navigation or actions here
                        Get.snackbar(
                          'Member Selected',
                          'You selected ${member.name}',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                      icon: Icon(CupertinoIcons.profile_circled), // Static icon
                      position: member.position, // Use position from Council model
                    );
                  }).toList(),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
