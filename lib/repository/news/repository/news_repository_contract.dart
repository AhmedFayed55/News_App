import 'package:news_app/model/NewsResponce.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponce?> getNewsBySourceId(String sourceId);
}
