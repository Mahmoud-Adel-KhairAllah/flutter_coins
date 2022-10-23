import 'package:flutter/material.dart';
import 'package:flutter_coins/Api/Repo/currencyRepo.dart';
import 'package:flutter_coins/Model/TCurrencyRatesBaseRespose.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CurrencyController extends GetxController {
  List<TCurrency> listCurency = [];

  bool isLoadedCurrency = false;
  int pageNumber = 1;

  
  

 

  getCurrencies() async {
    isLoadedCurrency = true;
    update();

    Map<String, dynamic> map = {'page_count': 1, 'page_Numger': pageNumber};
    listCurency = await CurrencyRepo.instant.getCurrencyListRepo(map);

    isLoadedCurrency = false;
    update();
    print(listCurency.length.toString());
  }

  

  @override
  void onInit() {
    // TODO: implement onInit
    print('start');
    getCurrencies();
 
    print('end');
    super.onInit();
  }
}
