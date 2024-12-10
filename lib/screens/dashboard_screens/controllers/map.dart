import 'package:get/get.dart';

class MapController extends GetxController {
  var selectedDistrict = RxnString(); // Observable for selected district

  // Map of district images
  final Map<String, String> districtImages = {
    'a1': 'lib/images/maps/a1.png',
    'a2': 'lib/images/maps/a2.png',
    'b1': 'lib/images/maps/b1.png',
    'b2': 'lib/images/maps/b2.png',
    'c1': 'lib/images/maps/c1.png',
    'c2': 'lib/images/maps/c2.png',
  };

  final String defaultMapImage = 'lib/images/maps/all.png'; // Default image

  // Function to set selected district
  void selectDistrict(String district) {
    selectedDistrict.value = district;
  }

  String getSelectedDistrictImage() {
    return selectedDistrict.value != null
        ? districtImages[selectedDistrict.value]!
        : defaultMapImage;
  }
}
