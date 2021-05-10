// class NewsCounter = _NewsCounter

import 'package:mobx/mobx.dart';
import 'package:sample_flutter_app/news_data.dart';
import 'package:sample_flutter_app/news_repository.dart';

import 'comman_export.dart';

part 'news_viewmodel.g.dart';

class NewsViewModel = _NewsViewModel with _$NewsViewModel;

abstract class _NewsViewModel with Store {
  @observable
  List<NewsData> list = [];

  @observable
  bool _apiCalling=false;

  @computed
  bool get apiCalling => _apiCalling;

  set apiCalling(bool value) {
    _apiCalling = value;
  }

  @observable
  String error="News not available";

  NewsRepository newsRepository;

  _NewsViewModel() {
    newsRepository = getIt<NewsRepository>();
    getData();
  }

  void getData() async {
    apiCalling=true;
    final result = await newsRepository.getNews();
    apiCalling=true;
    result.when(onSuccess: (successData) {
      list=[];
     successData.data.forEach((element) {
       if(element!=null) list.add(element);
     });


    }, onError: (error) {
      this.error=error;
    });
  }
}
