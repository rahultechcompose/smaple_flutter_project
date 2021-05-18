// class NewsCounter = _NewsCounter

import 'package:mobx/mobx.dart';
import 'package:sample_flutter_app/news_data.dart';
import 'package:sample_flutter_app/news_repository.dart';

import 'comman_export.dart';

part 'news_viewmodel.g.dart';

class NewsViewModel = _NewsViewModel with _$NewsViewModel;

abstract class _NewsViewModel with Store {
  @observable
  ApiCallStatus apiCallStatus = ApiCallStatus.init;

  @observable
  Observable< List<NewsData>> list = Observable<List<NewsData>>([]);

  @observable
  bool isLoading = false;

  // @computed
  // bool get apiCalling => _apiCalling;
  //
  // set apiCalling(bool value) {
  //   _apiCalling = value;
  // }

  @observable
  String error = "News not available";

  NewsRepository newsRepository;

  _NewsViewModel() {
    newsRepository = getIt<NewsRepository>();
    getData();
  }

  @action
  Future<void> getData() async {
    apiCallStatus = ApiCallStatus.loading;
    isLoading = true;
    final result = await newsRepository.getNews();
    isLoading = false;
    result.when(onSuccess: (successData) {
      apiCallStatus = ApiCallStatus.success;
      final List<NewsData> temp=[];
      for (final element in successData.data) {
        if (element != null) temp.add(element);
      }
      list.value=temp;
    }, onError: (error) {
      apiCallStatus = ApiCallStatus.error;
      this.error = error;
    });
  }
}
