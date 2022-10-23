import 'package:flutter/material.dart';
import 'package:flutter_coins/Module/Splash/splashScreen.dart';
import 'package:flutter_coins/utils/constant/constant.dart';

class CAlarmScreen extends StatefulWidget {
  CAlarmScreen({Key? key}) : super(key: key);

  @override
  State<CAlarmScreen> createState() => _CAlarmState();
}

class _CAlarmState extends State<CAlarmScreen> {
  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  var items1 = [
    'أكبر من ',
    'أصغر من ',
    'يساوي ',
  ];
  String dropdownvalue1 = 'أكبر من ';
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Row(
                            children: [
                              Text(
                                items,
                              ),
                              Icon(
                                Icons.access_alarm_rounded,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropdownvalue = value.toString();
                        });
                      },
                      value: dropdownvalue,
                    ),
                  ),
                ),
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
                                child: Row(
                                  children: [
                                    Text(
                                      items1,
                                    ),
                                    Icon(
                                      Icons.access_alarm_rounded,
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                dropdownvalue1 = value.toString();
                              });
                            },
                            value: dropdownvalue1,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            border: Border.all(width: 1)),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextField(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  child:
                      TextButton(onPressed: () {}, child: Text('إضافة تنبيه')),
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
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0.1),
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: const Icon(Icons.person_outlined),
                        trailing: InkWell(
                            onTap: () {
                              var snackBar =
                                  SnackBar(content: Text('Hello World${index}'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              print('object${index}');
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.green,
                            )),
                        title: Text("title $index"),
                        subtitle: Text("subtitle $index"),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
