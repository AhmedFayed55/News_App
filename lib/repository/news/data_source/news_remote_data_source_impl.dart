import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponce.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source_contract.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSourceContract {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponce?> getNewsBySourceId(String sourceId) {
    return apiManager.getNewsBySourceId(sourceId);
  }
}
