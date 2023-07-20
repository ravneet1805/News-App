import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/fetchdata.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:newsapp/view/widgets/myDrawer.dart';
import 'package:newsapp/view/widgets/news_container.dart';

import '../data/news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<News> _newsFuture;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _newsFuture = FetchNews.fetchNews();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
      // Fetch news data for the current page when it changes
      _newsFuture = FetchNews.fetchNews();
    });
  }

  Future<void> _refreshNews() async {
    // Fetch news data again when the user performs the refresh action
    setState(() {
      _newsFuture = FetchNews.fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: kSecondaryColor,
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("CometNews"),
            IconButton(onPressed:_refreshNews,
                icon: Icon(Icons.refresh)),
          ],
        ),

        backgroundColor: kSecondaryColor,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              width: MediaQuery.of(context).size.width*0.92,
              decoration: BoxDecoration(
                color: kPrimaryColor,

                borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
              ),
              child: FutureBuilder<News>(
                future: _newsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(color: kSecondaryColor,),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Refresh the App'),
                    );
                  } else {
                    final news = snapshot.data!;
                    return PageView.builder(
                      controller: PageController(initialPage: _currentPageIndex),
                      scrollDirection: Axis.vertical,
                      onPageChanged: _onPageChanged,
                      itemBuilder: (context, index) {
                        // Use the news data fetched for the current page
                        return NewsContainer(
                          imgUrl: news.imgUrl,
                          newsHead: news.newsHead,
                          newsDesc: news.newsDesc,
                          newsUrl: '',
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
