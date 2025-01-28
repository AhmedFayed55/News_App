import 'package:news_app/model/NewsResponce.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source_contract.dart';
import 'package:news_app/repository/news/repository/news_repository_contract.dart';

class NewsRepositoryImpl implements NewsRepositoryContract {
  NewsRemoteDataSourceContract newsRemoteDataSourceContract;

  NewsRepositoryImpl({required this.newsRemoteDataSourceContract});

  @override
  Future<NewsResponce?> getNewsBySourceId(String sourceId) {
    return newsRemoteDataSourceContract.getNewsBySourceId(sourceId);
  }
}
