import 'package:get/get.dart';

class YearPlanController extends GetxController {
  var yearPlans = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchYearPlans();
  }

  void fetchYearPlans() {
    // Simulate fetching data from an API or database
    yearPlans.value = List.generate(12, (index) => 'Plan for month ${index + 1}');
  }
}