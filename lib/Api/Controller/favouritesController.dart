import 'package:flutter_coins/Helper/DioHelper.dart';
import 'package:flutter_coins/utils/constant/constant.dart';

class FavoritesApiController {
  static getFavorites() {
    return DioHelper().get(pathFavoritesList);
  }
}
