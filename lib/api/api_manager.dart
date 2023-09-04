import 'dart:convert';
import 'package:http/http.dart' as http;

import 'module/news_response.dart';

class ApiManager {
  static String baseUrl = "https://newsapi.org/v2";
  static String apiKey = "30dd5bede3db4367a5a1ab6dbe34858d";

  static Future<NewsResponse> getNews({int? page}) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=$apiKey&page=$page&pageSize=50"));
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

  static Future<NewsResponse> getNews2({String? keywordSearch = "a"}) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?apiKey=$apiKey&q=$keywordSearch"));
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
