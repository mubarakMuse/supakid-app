import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';


import '../../../../../utils/app_images.dart';

class KidHomeController extends GetxController {

  var data = Get.arguments;

  final List category = [
    {"image": kLearningIMG, "label": kLearn},
    {"image": kFact, "label": kSports},
    {"image": kArtsIMG, "label": kAnimal},
    {"image": kLearningIMG, "label": kArt},
    {"image": kFact, "label": kSpace},
  ];
  final List watching = [
    {"image": kWatching1, },
    {"image": kThumbnail, },
    {"image": kThumbnail2},
    {"image": kWatching1, },
    {"image": kThumbnail, },
  ];


}
