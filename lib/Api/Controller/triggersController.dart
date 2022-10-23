import 'package:flutter_coins/Api/DioHelper.dart';
import 'package:flutter_coins/utils/constant/constant.dart';

class TriggerApiController {
  static getTriggers() {
    return DioHelper().get(pathTriggers);
  }

  static postTrigger(String s_code, int i_type, String d_value, String s_udid,
      String s_pns_token) {
    return DioHelper().post(pathTriggers, data: {
      's_code': s_code,
      'i_type': i_type,
      'd_value': d_value,
      's_udid': s_udid,
      's_pns_token': s_pns_token
    });
  }
}
