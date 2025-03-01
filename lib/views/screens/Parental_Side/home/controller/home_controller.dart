import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = (-7).obs;

   changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
