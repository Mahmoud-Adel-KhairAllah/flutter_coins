import 'package:flutter_coins/Api/Controller/triggersController.dart';
import 'package:flutter_coins/Model/TNewsBaseResponse.dart';

import '../../Model/TCurrencyRatesBaseRespose.dart';

class TriggerRepo {
  static var instant = TriggerRepo();
  Future<List<TCurrency>> getTrigeersListRepo() async {
    List<TCurrency> listTriggersCurrency = [];
    var response = await TriggerApiController.getTriggersController();
    if (response.statusCode == 200) {
      listTriggersCurrency = List<TCurrency>.from(response.data["condition"]
          .map((object) => TCurrency.fromJson(object)));
    }
    return listTriggersCurrency;
  }

  Future<Status> postTriggerRepo(String s_code, int i_type, String d_value,
      String s_udid, String s_pns_token) async {
    Status? status;
    var response = await TriggerApiController.postTriggerController(
        s_code, i_type, d_value, s_udid, s_pns_token);
    if (response.statusCode == 200) {
      status = Status.fromJson(response.data['status']);
    }
    return status!;
  }

  Future<Status> deleteTriggerRepo(int id) async {
    Status? status;
    var response = await TriggerApiController.deleteTriggerController(id);
    if (response.statusCode == 200) {
      status = Status.fromJson(response.data['status']);
    }else if(response.statusCode == 422 ){
      status = Status.fromJson(response.data['status']);
    }
    return status!;
  }
}
