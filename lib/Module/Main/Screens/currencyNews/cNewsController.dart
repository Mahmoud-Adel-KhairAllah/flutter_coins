import 'package:flutter_coins/Api/Repo/newsRepo.dart';
import 'package:flutter_coins/Model/TNewsBaseResponse.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class NewsController extends GetxController {
  List<TNews> listNews = [];
   List<TNews> listNewsbyid = [];
  bool isloadedNews = false;

  getNews() async {
    isloadedNews = true;
    update();
    listNews = await NewsRepo().getNews();
    listNewsbyid=await NewsRepo().getNewsById(19);
    isloadedNews = false;
    update();
    print(listNews.length.toString()+'5555');
    print(listNewsbyid.length.toString()+'44444');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print('startnews');
    getNews();
  
    print('endnews');
    super.onInit();
  }
}
