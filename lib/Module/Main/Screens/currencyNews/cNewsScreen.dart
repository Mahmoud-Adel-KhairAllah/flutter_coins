import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyNews/cNewsController.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyNews/detailsNews/detailsNewsScreen.dart';
import 'package:get/get.dart';

import '../../../../Model/TNewsBaseResponse.dart';

class CNewsScreen extends StatefulWidget {
  const CNewsScreen({Key? key}) : super(key: key);

  @override
  State<CNewsScreen> createState() => _CNewsScreenState();
}

class _CNewsScreenState extends State<CNewsScreen> {
  NewsController newsController = Get.find<NewsController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<NewsController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            shrinkWrap: false,
            itemCount: controller.listNews.length,
            itemBuilder: (context, index) {
              if (controller.isloadedNews == true) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Card(
                  shadowColor: Colors.black,
                  child: ListTile(
                    trailing: CachedNetworkImage(
                      imageUrl: '${controller.listNews[index].sImage}',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported),
                    ),
                    title: Text('${controller.listNews[index].sTitle}'),
                    subtitle: Center(
                        child: Text(
                            '${controller.listNews[index].dtCreatedDate}')),
                    onTap: () {
                      Get.to(()=> DetailsNewsScreen(
                        tNews: TNews(
                            sTitle: '${controller.listNews[index].sTitle}',
                            sImage: '${controller.listNews[index].sImage}',
                            sDescription:
                                '${controller.listNews[index].sDescription}'),
                      ));
                    },
                  ),
                );
              }
            }),
      ),
    ));
  }
}

