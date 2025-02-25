import 'package:get/get.dart';
import '../../../../../utils/app_strings.dart';

class SplashController extends GetxController {
  final RxDouble logoSize = 50.0.obs;


  @override
  void onInit() {
    super.onInit();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(microseconds: 10), () {
      logoSize.value = 200;
    });

    Future.delayed(const Duration(seconds: 4), () {
      Get.toNamed(kOnBoarding);
      // Get.toNamed(kGetProfile);
    });
  }




}
