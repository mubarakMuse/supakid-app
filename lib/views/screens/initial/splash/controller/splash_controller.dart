 import 'package:get/get.dart';
import 'package:supakids/utils/helpers/global.dart';
import '../../../../../../utils/app_strings.dart';

import '../../../../services/storage.dart';

  class SplashController extends GetxController {
    final RxDouble logoSize = 50.0.obs;

    @override
    void onInit() {
      super.onInit();
      _startAnimation();

    }

    void _startAnimation() {
      Future.delayed(const Duration(milliseconds: 10), () {
        logoSize.value = 200;
      });

      Future.delayed(const Duration(seconds: 2), () async {
        await goNext();
      });
    }

    goNext() {
      Storage.getLogin().then((val) {
        if (val == false) {
          Get.offNamed(kLogin);
        } else {
          userSD = val;
          Get.offNamed(kAllProfiles);
        }
      });
    }
  }
