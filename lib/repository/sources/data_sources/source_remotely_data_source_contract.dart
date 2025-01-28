import 'package:news_app/model/SourceResponce.dart';

abstract class SourceRemotelyDataSourceContract {
  Future<SourceResponce?> getSources(String categoryId);
}
