import 'package:flutter_coins/Helper/DioHelper.dart';
import 'package:flutter_coins/utils/constant/constant.dart';

class NewsApiController {
  static getNews() {
    return DioHelper().get(pathNewsList);
  }

  static gettNewsById(int id) {
    return DioHelper().get(pathById+id.toString());
  }
}
