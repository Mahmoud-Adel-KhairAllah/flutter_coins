import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class App {
  static String? udid;
  static init() async {
    await getId();
  }

  static Future<String?> getId() async {
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
}
