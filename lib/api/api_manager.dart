import 'dart:convert';
import 'package:http/http.dart' as http;

import 'module/news_response.dart';

class ApiManager {
  static String baseUrl = "https://newsapi.org/v2";
  static String apiKey = "132de28b0fe546609a6e9ca8c097cda3";

  static Future<NewsResponse> getNews({int? page}) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&category=health&apiKey=c9402154dc394d4a9a07b1bb1cb16cbc&page=$page&pageSize=20"));
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

  static Future<NewsResponse> getNews2({String? keywordSearch}) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?apiKey=$apiKey&q=$keywordSearch"));
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
