import 'package:get/get.dart';
import 'package:leomd/widgets/nav_bar.dart';

class RandDController extends GetxController {
  // Add any required logic or state management here in the future
  void navigateToFinalPage() {
    Get.off(() => FinalPage());
  }
}
