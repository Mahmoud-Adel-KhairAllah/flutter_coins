import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_coins/Model/TCurrencyRatesBaseRespose.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyRates/CurruncyList/curruncyListScreen.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyRates/cRateController.dart';
import 'package:flutter_coins/Module/Main/mainScreen.dart';
import 'package:flutter_coins/utils/constant/constant.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../../../Splash/splashScreen.dart';


class CRateScreen extends StatefulWidget {
  CRateScreen({Key? key}) : super(key: key);

  @override
  State<CRateScreen> createState() => _CRateState();
}

class _CRateState extends State<CRateScreen> {
  bool isvisibalchechbox = false;
  bool isSelect = false;
  bool sv = false;
  List<TCurrency> listCurrency = [];
  CurrencyController currencyController = Get.find<CurrencyController>();
  var udid = Uuid();
  getfaveBox() async {
    Box box = await Hive.openBox('fave');
    setState(() {
      for (int i = 0; i < box.length; i++) {
        TCurrency currency = box.getAt(i);
        print(
            '${currency.sName} ${currency.sIcon} ${currency.sCode} ${currency.dTrading} ${currency.sName} ${currency.sIcon} ${currency.sCode} ${currency.dTrading}');

        listCurrency.add(currency);
      }
      print(listCurrency.length);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(()  {
      getfaveBox();
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CurrencyController>(
        builder: ((controller) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                textDirection: TextDirection.ltr,
                children: [
                  Text(
                    'أسعار العملات الإلكترونية',
                    style: h1textStyle,
                  ),
                  Text(
                    'أخر تحديث:1/1/2000',
                    style: h2textStyle,
                  ),
                  Flexible(
                    child: controller.isLoadedCurrency == true
                        ? Center(child: CircularProgressIndicator())
                        : CustomScrollView(
                            slivers: [
                              SliverGrid(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200.0,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 1.5,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int indexgrid) {
                                    return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () async {
                                            setState(() {
                                              isvisibalchechbox =
                                                  !isvisibalchechbox;
                                              print('isvisibalchechbox');
                                              print(isvisibalchechbox);
                                              print('isvisibalchechbox');
                                              print(indexgrid);
                                            });
                                          },
                                          child: listCurrency.length == 0
                                              ? addWidget()
                                              : favorateWidget(indexgrid),
                                        ));
                                  },
                                  childCount: listCurrency.length != 0
                                      ? listCurrency.length
                                      : 1,
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int indexsliver) {
                                  return SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustumRowWidget(),
                                          ),
                                          ListViewWidget(currencyController),
                                        ],
                                      ));
                                }, childCount: 1),
                              ),
                            ],
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: InkWell(
                      onTap: () => Get.to(() => const CurruncyListScreen()),
                      child: const Center(
                        child: Text(
                          'المزيد---->',
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                    )),
                  )
                ])),
      ),
    );
  }

  ListView ListViewWidget(CurrencyController controller) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: controller.listCurency.length,
        itemBuilder: (context, index) {
          return CustomLayoutCurrency(controller, index);
        });
  }

  CustomLayoutCurrency(CurrencyController controller, int index) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 40,
                        height: 40,
                        child: ClipOval(
                          child: Image.network(
                              controller.listCurency[index].sIcon!),
                        )),
                    SizedBox(
                      width: 2,
                    ),
                    Center(
                      child: Text(controller.listCurency[index].sCode!),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: Text(
                    controller.listCurency[index].dValue!.length > 5
                        ? controller.listCurency[index].dValue!.substring(0, 5)
                        : controller.listCurency[index].dValue!,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr),
              ),
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(controller.listCurency[index].dTrading!)),
                    if (isvisibalchechbox == true)
                      Checkbox(
                          value: listCurrency
                              .contains(controller.listCurency[index]),
                          onChanged: (v) async {
                            Box? box = await Hive.openBox('fave');

                            print(listCurrency.length);
                            if (v == true && listCurrency.length < 4) {
                              if (!listCurrency
                                  .contains(controller.listCurency[index])) {
                                listCurrency.add(controller.listCurency[index]);
                                setState(() {
                                  box.put('fav${index}',
                                      controller.listCurency[index]);
                                });
                              }
                            } else if (v == false) {
                              if (listCurrency
                                  .contains(controller.listCurency[index]))
                                setState(() {
                                  TCurrency currency = box.get('fav${index}');
                                  listCurrency.remove(currency);
                                  box.delete('fav${index}');
                                });
                            }
                            print('v');
                            print(v);
                            print(listCurrency.length);
                            print(isvisibalchechbox);
                            print('v');
                          })
                    else
                      Container(
                        width: 0,
                      ),
                  ],
                ),
              )
              //  Container(width: 40,height: 40,child: Image.network(controller.listCurency[index].sIcon))
            ],
          ),
        ),
      ),
    );
  }

  customContainer addWidget() {
    return customContainer(
      colors: colors[0],
      isdecoration: true,
      widget: Center(child: Icon(Icons.add)),
    );
  }

  favorateWidget(int indexgrid) {
    return customContainer(
      isdecoration: true,
      colors: colors[indexgrid + 1],
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 40,
              height: 40,
              child: ClipOval(
                  child: Image.network(listCurrency[indexgrid].sIcon!))),
          Text(listCurrency[indexgrid].sName!)
        ],
      ),
    );
  }
}

class CustumRowWidget extends StatelessWidget {
  const CustumRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 221, 221, 221),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'العملة ',
              style: h2textStyle,
            ),
            Text(
              'السعر',
              style: h2textStyle,
            ),
            Text(
              'التداول ',
              style: h2textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
