import 'package:news_app/model/NewsResponce.dart';

abstract class NewsRemoteDataSourceContract {
  Future<NewsResponce?> getNewsBySourceId(String sourceId);
}
