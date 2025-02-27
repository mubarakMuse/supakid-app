import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';

class AllProfilesController extends GetxController {
  var profiles = [
    {
      "name": kAlex,
      "age": "10 Years",
      "interest": "Space, Animals"
    },
    {
      "name": kEma,
      "age": "8 Years",
      "interest": "Drawing, Traveling"
    },
    {
      "name": kLiam,
      "age": "12 Years",
        "interest": "Sports, Animals"
    },
  ].obs;
}
