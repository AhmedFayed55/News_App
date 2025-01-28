import 'package:news_app/model/SourceResponce.dart';
import 'package:news_app/repository/sources/data_sources/source_remotely_data_source_contract.dart';
import 'package:news_app/repository/sources/repository/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract {
  SourceRemotelyDataSourceContract sourceRemotelyDataSourceContract;

  SourceRepositoryImpl({required this.sourceRemotelyDataSourceContract});

  @override
  Future<SourceResponce?> getSources(String categoryId) {
    return sourceRemotelyDataSourceContract.getSources(categoryId);
  }
}
