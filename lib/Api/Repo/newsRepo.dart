import 'dart:math';

import 'package:flutter_coins/Api/Controller/newsController.dart';
import 'package:flutter_coins/Model/TNewsBaseResponse.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class NewsRepo {
  static var instance = NewsRepo();
  Future<List<TNews>> getNews() async {
    List<TNews> listNews = [];
    var response = await NewsApiController.getNews();
    if (response.statusCode == 200) {
      listNews =
          List<TNews>.from(response.data['news'].map((e) => TNews.fromJson(e)));
    }

    return listNews;
  }

  Future<List<TNews>> getNewsById(int id) async {
    List<TNews> listNews = [];
    var response = await NewsApiController.gettNewsById(id);
    if (response.statusCode == 200) {
      listNews =
          List<TNews>.from(response.data['news'].map((e) => TNews.fromJson(e)));
    }
    return listNews;
  }
}
