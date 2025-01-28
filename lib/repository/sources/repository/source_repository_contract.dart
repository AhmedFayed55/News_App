import 'package:news_app/model/SourceResponce.dart';

abstract class SourceRepositoryContract {
  Future<SourceResponce?> getSources(String categoryId);
}
