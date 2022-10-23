
import 'package:flutter_coins/Api/DioHelper.dart';
import 'package:flutter_coins/utils/constant/constant.dart';

class CurrencyApiController {
  static getCurrencyList(Map<String,dynamic>map) {
    return   DioHelper().get(pathCurrenciesList,queryParameters: map);
  
  }

  static getCurrencyJob() {
    return DioHelper().get(pathCurrenciesJob);
  }
}
