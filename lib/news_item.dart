import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_app/news_data.dart';
//ignore: must_be_immutable
class NewsItem extends StatelessWidget{
  NewsData data;

  NewsItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.title ?? "",
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  () {
                    if (data.image != null && data.image.isNotEmpty) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          data.image,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }(),
                 const SizedBox(width:10,),
                  Expanded(
                    child: Text(
                      data.summary ?? "",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  )
                ],
             )
            ],
          ),
        ),
        const SizedBox(height: 8,)
      ],
    );
  }
}