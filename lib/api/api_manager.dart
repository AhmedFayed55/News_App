import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/model/NewsResponce.dart';
import 'package:news_app/model/SourceResponce.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=31aa22ee801a42fb97510b27ca234a0e
  static Future<SourceResponce?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.endPoints,
        {"apiKey": ApiConstants.apiKey, "category": categoryId});

    var responce = await http.get(url);

    try {
      return SourceResponce.fromJson(jsonDecode(responce.body));
    } catch (e) {
      throw e;
    }
  }

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=31aa22ee801a42fb97510b27ca234a0e
  static Future<NewsResponce?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoints,
        {"apiKey": ApiConstants.apiKey, "sources": sourceId});
    var response = await http.get(url);
    try {
      return NewsResponce.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
