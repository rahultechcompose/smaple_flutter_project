

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:sample_flutter_app/news_data.dart';
import 'package:sample_flutter_app/news_item.dart';
import 'package:sample_flutter_app/news_viewmodel.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsPage();
  }
}

class _NewsPage extends State<NewsPage> {
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    log("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("News",style: TextStyle(color: Colors.white,fontSize: 18),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: Observer(
              builder: (_) {
                log("list Observer ");
                return ListView.builder(
                  itemCount: newsViewModel.list.length,
                  shrinkWrap: false,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return NewsItem(newsViewModel.list[index]);
                  },
                );
              },
            ),
          ),
          Observer(
            builder: (_) {
              log("build Observer ");
              if(newsViewModel.apiCalling)
                 return  Visibility(child:Center(child: Container(width: 40,height: 40,child: CircularProgressIndicator())),visible: newsViewModel.apiCalling);
              else
                return Container();
            },
          )
        ],
      ),

    );
  }
}
