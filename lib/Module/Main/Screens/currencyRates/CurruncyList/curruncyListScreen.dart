import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyRates/CurruncyList/currencyListController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../Model/TCurrencyRatesBaseRespose.dart';
import '../cRatesScreen.dart';

class CurruncyListScreen extends StatefulWidget {
  const CurruncyListScreen({super.key});

  @override
  State<CurruncyListScreen> createState() => _CurruncyListScreenState();
}

class _CurruncyListScreenState extends State<CurruncyListScreen> {
  CurrencyListController currencyListController =
      Get.find<CurrencyListController>();
  bool isvisibalchechbox = false;
  bool isSelect = false;
  List<TCurrency> listCurrency = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              currencyListController.onRefresh();
              // isvisibalchechbox = !isvisibalchechbox;
            });
          },
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: GetBuilder<CurrencyListController>(
            builder: (controller) => Column(
              children: [
                CustumRowWidget(),
                Flexible(
                  child: currencyListController.listCurency.isEmpty
                      ? const CircularProgressIndicator()
                      : RefreshIndicator(
                          onRefresh: () {
                            return currencyListController.onRefresh();
                          },
                          child: ListView(
                            children: [
                              ListView.builder(
                                controller:
                                    currencyListController.scrollController,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount:
                                    currencyListController.listCurency.length,
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              flex: 3,
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                // crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      width: 40,
                                                      height: 40,
                                                      child: ClipOval(
                                                        child: Image.network(
                                                            currencyListController
                                                                .listCurency[
                                                                    index]
                                                                .sIcon!),
                                                      )),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                        currencyListController
                                                            .listCurency[index]
                                                            .sCode!),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              flex: 3,
                                              child: Text(
                                                  currencyListController
                                                              .listCurency[
                                                                  index]
                                                              .dValue!
                                                              .length >
                                                          5
                                                      ? currencyListController
                                                          .listCurency[index]
                                                          .dValue!
                                                          .substring(0, 5)
                                                      : currencyListController
                                                          .listCurency[index]
                                                          .dValue!,
                                                  textAlign: TextAlign.justify,
                                                  textDirection:
                                                      TextDirection.ltr),
                                            ),
                                            Flexible(
                                              flex: 3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Center(
                                                      child: Text(
                                                          currencyListController
                                                              .listCurency[
                                                                  index]
                                                              .dTrading!)),
                                                  isvisibalchechbox == true
                                                      ? Checkbox(
                                                          value: listCurrency.contains(
                                                                  currencyListController
                                                                          .listCurency[
                                                                      index])
                                                              ? true
                                                              : false,
                                                          onChanged: (v) {
                                                            setState(() {
                                                              // isSelect =
                                                              // //     v!;
                                                              // Map<String, dynamic> c = jsonDecode(
                                                              //     controller.listCurency[index]
                                                              //         .toJson().toString()
                                                              //         );
                                                              // String cc =
                                                              //     jsonEncode(TCurrency.fromJson(c));
                                                              // print('mamammamaamam${cc}');

                                                              String c = jsonEncode(TCurrency.fromJson(currencyListController
                                                                      .listCurency[
                                                                          index]
                                                                      .toJson()))
                                                                  .toString();
                                                              // if (!widget.sharedPreferences
                                                              //     .c('c${index}')) {
                                                              //   widget.sharedPreferences.setString(
                                                              //       'c${index}', cc);
                                                              // }
                                                              print(jsonEncode(TCurrency.fromJson(currencyListController
                                                                      .listCurency[
                                                                          index]
                                                                      .toJson()))
                                                                  .toString());

                                                              // if(widget.sharedPreferences.containsKey('c${index}'))
                                                              // widget.sharedPreferences.remove('c${index}');
                                                              if (v == true &&
                                                                  listCurrency
                                                                          .length <
                                                                      4) {
                                                                if (!listCurrency.contains(
                                                                    currencyListController
                                                                            .listCurency[
                                                                        index])) {
                                                                  listCurrency.add(
                                                                      currencyListController
                                                                              .listCurency[
                                                                          index]);
                                                                }
                                                              } else if (v ==
                                                                  false) {
                                                                if (listCurrency.contains(
                                                                    currencyListController
                                                                            .listCurency[
                                                                        index]))
                                                                  listCurrency.remove(
                                                                      currencyListController
                                                                              .listCurency[
                                                                          index]);
                                                              }

                                                              print('v');
                                                              print(v);
                                                              print(listCurrency
                                                                  .length);
                                                              print(
                                                                  isvisibalchechbox);
                                                              print('v');
                                                            });
                                                          })
                                                      : Container(
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
                                },
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ));
  }
}
