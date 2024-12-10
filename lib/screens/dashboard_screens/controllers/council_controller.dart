import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leomd/auth/auth.dart'; // AuthHelper with Dio integration
import 'package:leomd/models/councilM.dart';

class CouncilController extends GetxController {
  var councilMembers = <Council>[].obs; // Observable list for council members
  var isLoading = true.obs; // Observable for loading state

  @override
  void onInit() {
    super.onInit();
    fetchCouncilMembers();
  }

  // Fetch council members using AuthHelper
  Future<void> fetchCouncilMembers() async {
    try {
      isLoading(true); // Set loading state to true
      final members = await AuthHelper().getCouncilMembers();
      councilMembers.assignAll(members); // Assign fetched members
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch council members.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false); // Set loading state to false
    }
  }
}
