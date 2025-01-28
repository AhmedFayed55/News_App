import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/repository/news/repository/news_repository_contract.dart';
import 'package:news_app/ui/home/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsRepositoryContract newsRepositoryContract;

  NewsViewModel({required this.newsRepositoryContract})
      : super(NewsLoadingState());
  void getNews(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await newsRepositoryContract.getNewsBySourceId(sourceId);
      if (response!.status == "ok") {
        emit(NewsSuccessState(newsList: response.articles!));
      } else {
        emit(NewsErrorState(errorMessage: response.message!));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}