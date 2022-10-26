import 'package:flutter_coins/Api/Controller/favouritesController.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
class FavoritesRepo{
  getFavorites() async {
    var responce=await FavoritesApiController.getFavorites();
    if(responce.statusCode==200){
      
    }
  }
}