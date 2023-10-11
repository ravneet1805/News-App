import 'dart:convert';
import 'package:http/http.dart';
import 'news.dart';

class FetchNews {
  static Future<List<News>> fetchNewsList(String apiEndpoint) async {
    try {
      Response response = await get(Uri.parse(apiEndpoint));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        List<dynamic> articles = responseData['articles'];

        List<News> newsList = articles.map((article) {
          return News.fromAPItoApp(article);
        }).toList();

        return newsList;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Failed to load news');
    }
  }
}
