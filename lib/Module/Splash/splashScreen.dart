import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coins/Module/Main/mainScreen.dart';
import 'package:flutter_coins/utils/constant/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.of(context)
        .pushReplacement(CupertinoPageRoute(builder: (e) => MainScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Stack(alignment: Alignment.center, children: [
          Column(
            children: [
              Row(children: [
                customContainer(colors: colors1),
                customContainer(colors: colors2),
              ]),
              Row(
                children: [
                  customContainer(colors: colors3),
                  customContainer(colors: colors4),
                ],
              )
            ],
          ),
          Positioned(
            child: Align(
              child: Column(
                children: [
                  Text(
                    'بلوك شين',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 15),
                          borderRadius: BorderRadius.circular(20))),
                ],
              ),
            ),
          )
        ]),
      ]),
    );
  }
}

class customContainer extends StatelessWidget {
  customContainer({
    Key? key,
    this.isdecoration = false,
    this.widget,
    required this.colors,
  }) : super(key: key);
  final List<Color> colors;
  final bool isdecoration;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: isdecoration == true ? BorderRadius.circular(20) : null,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors:
              colors, // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: widget,
    );
  }
}
