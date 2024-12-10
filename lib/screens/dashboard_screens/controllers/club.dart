import 'package:get/get.dart';

class LeoClubsController extends GetxController {
  // Observable list of clubs
  var clubs = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadClubs(); // Load clubs when the controller is initialized
  }

  void loadClubs() {
    // Example club data
    clubs.assignAll([
      {
        "title": "Leo Club of Sri Lanka Technology Campus",
        "iconPath": 'lib/images/home.svg',
      },
      {
        "title": "Leo Club of Colombo University",
        "iconPath": 'lib/images/home.svg',
      },
      {
        "title": "Leo Club of Kandy Central",
        "iconPath": 'lib/images/home.svg',
      },
      {
        "title": "Leo Club of Galle District",
        "iconPath": 'lib/images/home.svg',
      },
    ]);
  }

  void onClubTap(String title) {
    // Handle club tap actions
    Get.snackbar(
      'Club Selected',
      '$title was selected.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
