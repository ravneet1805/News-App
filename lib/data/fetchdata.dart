//https://newsapi.org/v2/top-headlines?country=us&apiKey=54b505aed2a24b23805e068284d0f24c
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';

import 'news.dart';

class FetchNews {
  static Future<News> fetchNews() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=54b505aed2a24b23805e068284d0f24c'));


    Map body_data = jsonDecode(response.body);
    List articles = body_data['articles'];
    //print(articles);
    print("************************************************");
    final random = new Random();
    var source = articles[random.nextInt(articles.length)];
    print(source);

   return  News.fromAPItoApp(source);
  }
}
