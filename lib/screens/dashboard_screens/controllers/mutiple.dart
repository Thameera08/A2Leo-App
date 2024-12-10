import 'package:get/get.dart';

class MultipleController extends GetxController {
  // Observable list of dashboard items
  final RxList<Map<String, String>> dashboardItems = <Map<String, String>>[
    {"title": "A1", "imgPath": "lib/images/leomap.png"},
    {"title": "A2", "imgPath": "lib/images/leomap.png"},
    {"title": "A1", "imgPath": "lib/images/leomap.png"},
    {"title": "A2", "imgPath": "lib/images/leomap.png"},
    {"title": "A1", "imgPath": "lib/images/leomap.png"},
  ].obs;

  // Main card data
  final RxMap<String, String> mainCard = {
    "title": "LEO MULTIPLE",
    "imgPath": "lib/images/leomap.png",
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
