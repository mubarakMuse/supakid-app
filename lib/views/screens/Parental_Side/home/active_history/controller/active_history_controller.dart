import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';

import '../../../../../../utils/app_images.dart';

class ActiveHistoryController extends GetxController {
  var historyList = [
    {"image": kSpaceIMG, "title": kSpaceKids, "time": kTime1},
    {"image": kLionIMG, "title": kFunAnimals, "time": kTime2},
    {"image": kChildIMG, "title": kDrawing , "time": kTime3},
  ].obs;
}
