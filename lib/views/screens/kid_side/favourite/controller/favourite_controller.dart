import 'package:get/get.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:supakids/views/custom_widgets/loading.dart';
import '../../../../../utils/app_images.dart';

class FavouriteController extends GetxController {

  var nextWatching = [
    {"image": kFav1, "title": kSpaceKids, "time": kTime1},
    {"image": kFav2, "title": kFunAnimals, "time": kTime2},
    {"image": kFav1, "title": kSpaceKids, "time": kTime1},

  ].obs;
  var isFavorite = <bool>[true, true, true].obs;

  void toggleFavorite(int index, context) {
    if (isFavorite[index]) {
      isFavorite[index] = false;
      nextWatching.removeAt(index);
      isFavorite.removeAt(index);
      showToast(context, msg: 'Removed from favourite successfully!', duration: 2);
    }
  }

}
