// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:leomd/widgets/nav_bar.dart';

class RandDController extends GetxController {
    var itemCount = 6.obs; 
  // Add any required logic or state management here in the future
  void navigateToFinalPage() {
    Get.off(() => FinalPage());
  }
}
