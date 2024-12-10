import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:leomd/screens/dashboard_screens/screens/a2teams/a2teams.dart';
import 'package:leomd/screens/homescreen.dart';
import 'package:leomd/screens/dashboard_screens/screens/clubs/leoclubs.dart';
import 'package:leomd/screens/dashboard_screens/screens/mutiple/multiplescreen.dart';
import 'package:leomd/themes/themes.dart';

class FinalPageController extends GetxController {
  // Observable index for the selected tab
  var selectedIndex = 2.obs;

  // List of widgets for the tabs
  final List<Widget> widgetOptions = [
    Multiple(),
    A2teams(),
    Homescreen(),
    LeoClubs(),
    Center(
      child: Text(
        'Docs',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  // Method to update the selected tab
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  // Method to reset to the home screen
  void resetToHome() {
    selectedIndex.value = 2;
  }
}

class FinalPage extends StatelessWidget {
  FinalPage({Key? key}) : super(key: key);

  final FinalPageController controller = Get.put(FinalPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Obx(() => controller.widgetOptions[controller.selectedIndex.value]),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () => controller.resetToHome(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: AppColors.white,
          child: SvgPicture.asset(
            'lib/images/home.svg',
            width: 40,
            height: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined, size: 30),
              label: 'Multiple',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people, size: 30),
              label: 'A2 Leaders',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(), // Spacer item
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded, size: 30),
              label: 'Clubs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder, size: 30),
              label: 'Documents',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.grey,
          backgroundColor: AppColors.white,
          onTap: controller.onItemTapped,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
