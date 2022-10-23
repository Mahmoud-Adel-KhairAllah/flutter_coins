import 'package:flutter/material.dart';
import 'package:flutter_coins/Api/Repo/currencyRepo.dart';
import 'package:flutter_coins/Model/TCurrencyRatesBaseRespose.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CurrencyListController extends GetxController {
  List<TCurrency> listCurency = [];
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  bool isLoadedCurrency = false;
  int pageNumber = 1;
  bool stopLoadMore = false;
  //var url = baseUrl + pathCurrencies;

// nextPageTrigger will have a value equivalent to 80% of the list size.
// _scrollController fetches the next paginated data when the current postion of the user on the screen has surpassed

  getMoreCurrency() {
    print(scrollController.position.maxScrollExtent);
    print(scrollController.position.pixels);
    //var nextPageTrigger =pageNumber* scrollController.position.maxScrollExtent;
    print(scrollController.hasClients);
    if (!scrollController.hasClients) return;
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        loadMore();
      } else {
        print(scrollController.position.maxScrollExtent);
      }
    });
  }

  onRefresh() {
    listCurency.clear();
    pageNumber = 1;
    stopLoadMore = false;
    getCurrencies();
  }

  getCurrencies() async {
    isLoadedCurrency = true;
    update();

    Map<String, dynamic> map = {'page_count': 20, 'page_Numger': pageNumber};
    listCurency = await CurrencyRepo.instant.getCurrencyListRepo(map);

    isLoadedCurrency = false;
    update();
    print(listCurency.length.toString());
  }

  void loadMore() async {
    if (stopLoadMore) return;
    List<TCurrency> loadMoreCurrency = [];

    pageNumber += 1;
    Map<String, dynamic> map = {'page_count': 20, 'page_Numger': pageNumber};

    loadMoreCurrency = await CurrencyRepo.instant.getCurrencyListRepo(map);
    if (loadMoreCurrency.isEmpty) {
      stopLoadMore = true;
      print('isEmpty++++++++++++++++++++++++++++++');
    }
    listCurency.addAll(loadMoreCurrency);
    // isLoadedCurrency = false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print('start');
    getCurrencies();
    //getMoreCurrency();
    print('end');
    super.onInit();
  }
}
