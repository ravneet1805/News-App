class News {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String author;
  String name;
  String time;
  String url;

  News(
      {required this.imgUrl,
      required this.newsHead,
      required this.newsDesc,
      required this.author,
      required this.name,
      required this.time,
      required this.url});

  static News fromAPItoApp(Map<String, dynamic> source) {
    return News(
        imgUrl: source['urlToImage'] ?? '',
        newsHead: source['title'] ?? 'Title not Available',
        newsDesc: source['description'] ?? 'Desc not available',
        author: source['author'] ?? 'Anonymous',
        name: source['source']['name'] ?? '',
        time: source['publishedAt'] ?? '',
        url: source['url'] ?? '');
  }
}
