import 'package:flutter/material.dart';

import '../../Module/Main/Screens/currencyTrigger/cTriggerController.dart';

String baseUrl = 'https://newline.dev/currency/api/v1/';
String pathCurrenciesList = 'currencies/list';
String pathCurrenciesJob = 'currencies/job';
String pathTriggersList = 'triggers/list';
String pathAddTrigger = 'triggers';
String pathDeleteTrigger = 'triggers?id=';
String pathNewsList = 'news/list';
String pathFavoritesList = 'Favorites/list';
String pathById = 'news?id=';
TextStyle h1textStyle = TextStyle(color: Colors.black, fontSize: 30);
TextStyle h2textStyle = TextStyle(color: Colors.grey, fontSize: 15);

List<List<Color>> colors = [colors0, colors1, colors2, colors3, colors4];
List<Color> colors0 = [
  Color.fromARGB(255, 64, 227, 70),
  Color.fromARGB(15, 191, 68, 68),
];
List<Color> colors1 = [
  Color(0xffFFDB00),
  Color(0xffFFA500),
];
List<Color> colors2 = [
  Color(0xffFB79B4),
  Color(0xff9B81EC),
];
List<Color> colors3 = [
  Color(0xff58C4D8),
  Color(0xff478EDA),
];
List<Color> colors4 = [
  Color(0xff47E546),
  Color(0xff02DFB6),
];
