import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';
import '../../../../../utils/app_images.dart';

class DownloadsController extends GetxController {

  var downloads = [
    {"image": kCategory1, "title": kSpaceKids, "time": kTime1},
    {"image": kCategoryIMG, "title": kFunAnimals, "time": kTime2},
    {"image": kCategory3, "title": kDrawing , "time": kTime3},
    {"image": kCategory1, "title": kSpaceKids, "time": kTime1},
    {"image": kCategoryIMG, "title": kFunAnimals, "time": kTime2},
  ].obs;
}
