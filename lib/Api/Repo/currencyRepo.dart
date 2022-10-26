import 'package:flutter_coins/Api/Controller/currencyController.dart';
import 'package:flutter_coins/Model/TCurrencyRatesBaseRespose.dart';


import '../../Model/TNewsBaseResponse.dart';

class CurrencyRepo {
  static var instant = CurrencyRepo();
  Future<List<TCurrency>> getCurrencyListRepo(Map<String,dynamic>map) async {
    List<TCurrency> listCurrency = [];
    var response = await CurrencyApiController.getCurrencyList(map);
    if (response.statusCode == 200) {
      listCurrency = List<TCurrency>.from(response.data["currencies"]
          .map((object) => TCurrency.fromJson(object)));
    }
    return listCurrency;
  }

  Future<Status> getCurrencyJobRepo() async {
    Status status=new Status() ;
    var response=await CurrencyApiController.getCurrencyJob();
    if(response.statusCode==200){
      status=Status.fromJson(response.data['status'].map((e)=>Status.fromJson(e)));
    }

    return status;
  }
}
