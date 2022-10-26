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
  static String udid = '1ae86cab0690a366';
  getTriggers(String udid) async {
    isLoadedTrigeers = true;
    update();
    listTrigeers = await TriggerRepo.instant.getTrigeersListRepo(udid);

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
    getTriggers(udid);
    return status;
  }

  deleteTrigger(int id) async {
    Status status;
    isdeleteTrgger = true;
    update();
    status = await TriggerRepo.instant.deleteTriggerRepo(id);
    isdeleteTrgger = false;
    getTriggers(udid);
    update();
    return status;
  }

  Future<String?> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      udid = iosDeviceInfo.identifierForVendor!;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      print('${androidDeviceInfo.androidId}androidDeviceInfo.androidId');
      udid = androidDeviceInfo.androidId!;
      return androidDeviceInfo.id; // unique ID on Android
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getTriggers(udid);

    super.onInit();
  }
}
