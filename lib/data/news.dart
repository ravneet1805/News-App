import 'package:flutter/material.dart';

class News{
  String imgUrl;
  String newsHead;
  String newsDesc;

  News({
    required this.imgUrl,
    required this.newsHead,
    required this.newsDesc
});

 static News fromAPItoApp(Map<String, dynamic> source){
    return News(
        imgUrl: source['urlToImage']?? Text("Image not loading"),
        newsHead: source['title'],
        newsDesc: source['description']);
  }
}