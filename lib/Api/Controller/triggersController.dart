// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:dio/dio.dart';
import 'package:flutter_coins/Helper/DioHelper.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyTrigger/cTriggerController.dart';
import 'package:flutter_coins/utils/constant/constant.dart';

class TriggerApiController {
  static getTriggersController() {
    return DioHelper().get(pathTriggersList);
  }

  static postTriggerController(String s_code, int i_type, String d_value,
      String s_udid, String s_pns_token) {
    return DioHelper().post<Map<String, dynamic>>(pathAddTrigger, data: {
      's_code': s_code,
      'i_type': i_type,
      'd_value': d_value,
      's_udid': s_udid,
      's_pns_token': s_pns_token
    });
  }

  static deleteTriggerController(int id) {
    return DioHelper().delete(pathDeleteTrigger + '${id}');
  }
}
