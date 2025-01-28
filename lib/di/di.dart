import 'package:news_app/api/api_manager.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source_contract.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/repository/news_repository_contract.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';
import 'package:news_app/repository/sources/data_sources/source_remotely_data_source_impl.dart';
import 'package:news_app/repository/sources/repository/source_repository_contract.dart';
import 'package:news_app/repository/sources/repository/source_repository_impl.dart';

import '../repository/sources/data_sources/source_remotely_data_source_contract.dart';

SourceRepositoryContract injectSourceSourceRepository() {
  return SourceRepositoryImpl(
      sourceRemotelyDataSourceContract:
          injectSourceRemotelyDataSourceContract());
}

SourceRemotelyDataSourceContract injectSourceRemotelyDataSourceContract() {
  return SourceRemotelyDataSourceImpl(apiManager: injectApiManager());
}

ApiManager injectApiManager() {
  return ApiManager();
}

NewsRepositoryContract injectNewsRepositoryContract() {
  return NewsRepositoryImpl(
      newsRemoteDataSourceContract: injectNewsRemoteDataSourceContract());
}

NewsRemoteDataSourceContract injectNewsRemoteDataSourceContract() {
  return NewsRemoteDataSourceImpl(apiManager: injectApiManager());
}
