import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_coins/Api/Repo/triggersRepo.dart';
import 'package:flutter_coins/Model/TNewsBaseResponse.dart';
import 'package:get/state_manager.dart';

import '../../../../Model/TCurrencyRatesBaseRespose.dart';

class CurrencyTriggerController extends GetxController {
  static var instant = CurrencyTriggerController();
  List<TCurrency> listTrigeers = [];
  Status statuspost = Status();
  Status? statusdelete;

  bool isLoadedTrigeers = false;
  bool isPostTrigger = false;
  bool isdeleteTrgger = false;
  int pageNumber = 1;
  getTriggers() async {
    isLoadedTrigeers = true;
    update();
    listTrigeers = await TriggerRepo.instant.getTrigeersListRepo();

    isLoadedTrigeers = false;
    update();
    print('-------------->${listTrigeers.length.toString()}');
  }

  postTrigger(String s_code, int i_type, String d_value, String s_udid,
      String s_pns_token) async {
    Status status;
    isPostTrigger = true;
    update();
    status = await TriggerRepo.instant
        .postTriggerRepo(s_code, i_type, d_value, s_udid, s_pns_token);

    isPostTrigger = false;
    update();
    getTriggers();
    return status;
  }

  deleteTrigger(int id) async {
    Status status;
    isdeleteTrgger = true;
    update();
    status = await TriggerRepo.instant.deleteTriggerRepo(id);
    isdeleteTrgger = false;
    getTriggers();
    update();
    return status;
  }


  @override
  void onInit() {
    // TODO: implement onInit
    getTriggers();

    super.onInit();
  }
}
