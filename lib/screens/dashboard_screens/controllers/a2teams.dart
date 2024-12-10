import 'package:get/get.dart';

class A2TeamsController extends GetxController {
  // Observable list of team data
  final teams = <Map<String, String>>[
    {"title": "A2 Teams", "imgPath": "lib/images/dplogo.png"},
    {"title": "A2 Teams", "imgPath": "lib/images/dplogo.png"},
    {"title": "A2 Teams", "imgPath": "lib/images/dplogo.png"},
    {"title": "Lions Cabinet\nExecutive", "imgPath": "lib/images/dplogo.png"},
  ].obs;

  // Example method to handle onTap action
  void onTeamSelected(String title) {
    Get.snackbar(
      'Team Selected',
      '$title was tapped',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.primaryColor,
      colorText: Get.theme.primaryColorDark,
    );
  }
}
