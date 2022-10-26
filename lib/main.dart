import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coins/Model/TCurrencyRate.g.dart';
import 'package:flutter_coins/Module/Splash/splashScreen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'App/app.dart';

void main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  Directory documentDirectory = await getApplicationDocumentsDirectory();
  Hive
    ..init(documentDirectory.path)
    ..registerAdapter(TCurrencyAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     App.init();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Directionality(
          textDirection: TextDirection.rtl, child: SplashScreen()),
    );
  }
}
