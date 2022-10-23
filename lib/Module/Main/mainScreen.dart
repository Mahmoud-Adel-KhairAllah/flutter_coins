import 'package:flutter/material.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyRates/CurruncyList/currencyListController.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyRates/cRatesScreen.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyAlarm/cAlarmScreen.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyNews/cNewsScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'Screens/currencyNews/cNewsController.dart';
import 'Screens/currencyRates/cRateController.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final cController = Get.put(CurrencyController());
  final newsController = Get.put(NewsController());
  final CurrencyListController currencyListController =
      Get.put(CurrencyListController());
  int _selected = 0;
  var _screens = [CRateScreen(), CAlarmScreen(), CNewsScreen()];
  var _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _selected = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: _selected == 0
                  ? SvgPicture.asset(
                      'assets/images/s_Group.svg',
                      width: 18.0,
                      height: 18.0,
                    )
                  : SvgPicture.asset(
                      'assets/images/Group.svg',
                      width: 18.0,
                      height: 18.0,
                    ),
              label: 'أسعار العملات'),
          BottomNavigationBarItem(
              icon: _selected == 1
                  ? SvgPicture.asset(
                      'assets/images/s_Bell.svg',
                      width: 18.0,
                      height: 18.0,
                    )
                  : SvgPicture.asset(
                      'assets/images/Bell.svg',
                      width: 18.0,
                      height: 18.0,
                    ),
              label: 'منبه العملات'),
          BottomNavigationBarItem(
              icon: _selected == 2
                  ? SvgPicture.asset(
                      'assets/images/s_Menu.svg',
                      width: 18.0,
                      height: 18.0,
                    )
                  : SvgPicture.asset(
                      'assets/images/Menu.svg',
                      width: 18.0,
                      height: 18.0,
                    ),
              label: 'أخبار وتقارير'),
        ],
        currentIndex: _selected,
        onTap: (index) {
          setState(() {
            _selected = index;
            _pageController.animateToPage(_selected,
                duration: Duration(microseconds: 10), curve: Curves.linear);
          });
        },
      ),
    );
  }
}
