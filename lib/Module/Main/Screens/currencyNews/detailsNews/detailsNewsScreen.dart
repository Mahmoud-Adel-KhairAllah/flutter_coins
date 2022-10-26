import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_coins/Module/Main/Screens/currencyNews/cNewsScreen.dart';
import 'package:flutter_coins/utils/constant/constant.dart';

import '../../../../../Model/TNewsBaseResponse.dart';

class DetailsNewsScreen extends StatelessWidget {
   DetailsNewsScreen({this.tNews});
  TNews? tNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('${tNews!.sTitle}'),centerTitle: false,),
      body: SafeArea(
        child: ListView(
          
          children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${tNews!.sTitle}',style: h1textStyle,textAlign: TextAlign.end,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${tNews!.dtCreatedDate}',style: h2textStyle,textAlign: TextAlign.end,),
              ),
              CachedNetworkImage(
                        imageUrl: '${tNews!.sImage}',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                             Image.network('https://www.kaspersky.com/content/en-global/images/repository/isc/2021/cryptocurrency_image1_1130490519_670x377px_300dpi.jpg'),
                      ),
      Row(
             children: [
               TextButton(onPressed: (){}, child: Text('مشاركة على فيسبوك',style: TextStyle(backgroundColor: Colors.blue,color: Colors.white,fontWeight: FontWeight.bold),textDirection: TextDirection.ltr,)),
               TextButton(onPressed: (){}, child: Text('مشاركة على تويتر',style: TextStyle(backgroundColor: Colors.lightBlueAccent,color: Colors.white,fontWeight: FontWeight.bold),)),
                IconButton(onPressed: (){}, icon: Icon(Icons.share))
             ],
           ),
              Text('${tNews!.sDescription}',textAlign: TextAlign.end,textWidthBasis: TextWidthBasis.parent,),
            ],
          ),
         
        ],),
      ),
    );
  }
}
