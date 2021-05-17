
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sample_flutter_app/news_item.dart';
import 'package:sample_flutter_app/news_viewmodel.dart';
import 'comman_export.dart';


class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewmodel=NewsViewModel();
    return Provider(
      create: (context) =>viewmodel,
      child: NewsContent(viewmodel),
    );
  }
}

class NewsContent extends StatefulWidget {
  NewsViewModel viewModel;


  NewsContent(this.viewModel);

  @override
  State<StatefulWidget> createState() {
    return _NewsContent();
  }
}

// flutter packages pub run build_runner build
class _NewsContent extends State<NewsContent> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  itemCount: widget.viewModel.list.value.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewsItem( widget.viewModel.list.value[index]);
                  },
                );
              },
            ),
          ),
          Observer(
            builder: (_) {
              return Visibility(
                  visible: !widget.viewModel.isLoading &&
                      widget.viewModel.list.value.isNullOrEmpty()
                      ? true
                      : false,
                  child: Center(
                    child: Text(
                      widget.viewModel.error,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ));
            },
          ),
          Observer(
            builder: (_) {
              return Visibility(
                  visible:  widget.viewModel.isLoading,
                  child: const Center(
                      child: SizedBox(
                    width: 50,
                    height: 50,
                    child:  CircularProgressIndicator(),
                  )));
            },
          )
        ],
      ),
    );
  }
}
