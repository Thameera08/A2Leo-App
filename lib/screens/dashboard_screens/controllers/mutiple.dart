import 'package:get/get.dart';

class MultipleController extends GetxController {
  // Observable list of dashboard items
  final RxList<Map<String, String>> dashboardItems = <Map<String, String>>[
    {"title": "A1 District", "imgPath": "lib/images/a1.jpg"},
    {"title": "B1 District", "imgPath": "lib/images/b1.png"},
    {"title": "B2 District", "imgPath": "lib/images/b2.png"},
    {"title": "C1 District", "imgPath": "lib/images/c1.jpg"},
    {"title": "C2 District", "imgPath": "lib/images/c2.png"},
  ].obs;

  // Main card data
  final RxMap<String, String> mainCard = {
    "title": "LEO MULTIPLE 306",
    "imgPath": "lib/images/mdlogo.png",
  }.obs;

  // Action when a dashboard item is tapped
  void onItemTap(String title) {
    Get.snackbar(
      'Item Selected',
      '$title was tapped.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.primaryColor,
      colorText: Get.theme.primaryColorDark,
    );
  }
}
