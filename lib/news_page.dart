

import 'dart:developer';
import 'comman_export.dart';
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
// flutter packages pub run build_runner build
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
              return Visibility(
                visible: !newsViewModel.isLoading&&newsViewModel.list.isNullOrEmpty()?true:false,
                child: Container(
                  child: Center(
                    child: Text(newsViewModel.error,style: Theme.of(context).textTheme.headline,),
                  ),
                ),
              );
            },
          ),
          Observer(
            builder: (_) {
              return Visibility(
                visible: newsViewModel.isLoading,
                child: Container(
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    )
                  ),
                ),
              );
            },
          )
        ],
      ),

    );
  }
}
