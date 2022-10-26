
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_coins/App/app.dart';
import 'package:flutter_coins/Model/TNewsBaseResponse.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyRates/cRateController.dart';
import 'package:flutter_coins/utils/constant/constant.dart';
import 'package:get/get.dart';


import '../../../../Model/TCurrencyRatesBaseRespose.dart';
import 'cTriggerController.dart';

class CTriggerScreen extends StatefulWidget {
  CTriggerScreen({Key? key}) : super(key: key);

  @override
  State<CTriggerScreen> createState() => _CTriggerState();
}

class _CTriggerState extends State<CTriggerScreen> {
  // Initial Selected Value
  TCurrency? currencydropdownvalue;
  CurrencyController currencyController = Get.find<CurrencyController>();
  CurrencyTriggerController currencyTriggerController =
      Get.find<CurrencyTriggerController>();
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    // textEditingController.addListener(() {
    currencydropdownvalue = currencyController.listCurency.first;
    // });
    super.initState();
  }

  var items1 = [
    'أصغر من',
    'يساوي',
    'أكبر من',
  ];
  String? typeTriggerdropdownvalue;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          textDirection: TextDirection.ltr,
          children: [
            Text(
              'منبه العملات    ',
              style: h1textStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'يرجى إختيار نوع العملة',
                    style: h2textStyle,
                  ),
                  GetBuilder<CurrencyController>(
                    builder: (controller) => Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1)),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: DropdownButton<TCurrency>(
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          underline: const Text(''),
                          autofocus: true,
                          enableFeedback: false,
                          isDense: false,
                          items:
                              controller.listCurency.map((TCurrency tCurrency) {
                            return DropdownMenuItem<TCurrency>(
                              value: tCurrency,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 50),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tCurrency.sCode.toString(),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ClipOval(
                                        child: CachedNetworkImage(
                                      width: 40,
                                      height: 40,
                                      imageUrl: tCurrency.sIcon.toString(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ))
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              currencydropdownvalue = value;
                            });
                          },
                          value: currencydropdownvalue,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'يرجى تحديد قيمة المنبه',
                    style: h2textStyle,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              border: Border.all(width: 1)),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              isExpanded: true,
                              underline: Text(''),
                              autofocus: true,
                              enableFeedback: false,
                              isDense: false,
                              items: items1.map((String items1) {
                                return DropdownMenuItem(
                                  value: items1,
                                  child: Center(
                                    child: Text(
                                      items1,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  typeTriggerdropdownvalue = value.toString();
                                });
                              },
                              value: typeTriggerdropdownvalue,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              border: Border.all(width: 1)),
                          alignment: Alignment.center,
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            controller: textEditingController,

                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GetBuilder<CurrencyTriggerController>(
                    builder: (controller) => Container(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () async {
                            Status status= await controller.postTrigger(
                                currencydropdownvalue!.sCode.toString(),
                                items1.indexOf(typeTriggerdropdownvalue!) + 1,
                                textEditingController.text,
                                App.udid.toString(),
                                's_pns_token');

                              final snackBar = SnackBar(
                                  content: Text('${status.message.toString()}'));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                          },
                          child: Text('إضافة تنبيه')),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(0.8, 1),
                          colors:
                              colors1, // Gradient from https://learnui.design/tools/gradient-generator.html
                          tileMode: TileMode.mirror,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<CurrencyTriggerController>(
              builder: (triggercontroller) => Expanded(
                child: triggercontroller.listTrigeers.isEmpty
                    ? Center(child: Text('لا يوجد تنبيهات'))
                    : ListView.builder(
                        itemCount: triggercontroller.listTrigeers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 0.1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                leading: ClipOval(
                                  child: Image.network(
                                      '${triggercontroller.listTrigeers[index].sIcon}'),
                                ),
                                trailing: InkWell(
                                    onTap: () async{

                                     Status status= await triggercontroller.deleteTrigger(
                                          triggercontroller
                                              .listTrigeers[index].pkIId!);
                                      var snackBar = SnackBar(
                                          content: Text('${triggercontroller.listTrigeers[index].sCode} ${status.message}'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      print('${triggercontroller.listTrigeers[index].sCode}');
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.green,
                                    )),
                                title: Text(
                                    "${triggercontroller.listTrigeers[index].sCode}  ${items1[int.parse(triggercontroller.listTrigeers[index].i_type!) - 1]} ${triggercontroller.listTrigeers[index].dValue}"),
                              ),
                            ),
                          );
                        }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
