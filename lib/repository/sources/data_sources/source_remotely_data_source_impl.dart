import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/SourceResponce.dart';
import 'package:news_app/repository/sources/data_sources/source_remotely_data_source_contract.dart';

class SourceRemotelyDataSourceImpl implements SourceRemotelyDataSourceContract {
  ApiManager apiManager;

  SourceRemotelyDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponce?> getSources(String categoryId) {
    return apiManager.getSources(categoryId);
  }
}
