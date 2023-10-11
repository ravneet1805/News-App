import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/data/fetchdata.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:newsapp/ads/ads.dart';
import 'package:newsapp/view/home_card.dart';
import 'package:newsapp/view/widgets/myDrawer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> _refreshNews() async {
    // Fetch news data again when the user performs the refresh action
    setState(() {
      FetchNews.fetchNewsList(
          'https://newsapi.org/v2/top-headlines?language=en&apiKey=54b505aed2a24b23805e068284d0f24c');
    });
    refreshController.loadComplete();
  }

  String getTimeOfDay() {
    final now = DateTime.now();
    final currentTime = now.hour;

    if (currentTime >= 5 && currentTime < 12) {
      return 'Morning';
    } else if (currentTime >= 12 && currentTime < 17) {
      return 'Afternoon';
    } else if (currentTime >= 17 && currentTime < 21) {
      return 'Evening';
    } else {
      return 'Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeOfDay = getTimeOfDay();
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          backgroundColor: kSecondaryColor,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: kTextColor),
            //leading: Icon(Icons.menu_outlined, color: kTextColor,),
            title: Text(
              "CometNews",
              style: kHeadingStyle,
            ),
            backgroundColor: kSecondaryColor,
            elevation: 0,
            actions: const [
              // IconButton(
              //   //onPressed: _refreshNews,
              //   icon: Icon(Icons.refresh),
              // ),
            ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: kSecondaryColor,
                labelColor: kTextColor,
                indicatorWeight: 0.01,
                labelStyle: kLabelStyle,
                unselectedLabelColor: Colors.black54,
                unselectedLabelStyle: kUnselectedLabelStyle,
                tabs: const [
                  Tab(text: 'Trending'),
                  Tab(text: 'Business'),
                  Tab(text: 'Entertainment'),
                  Tab(text: 'Health'),
                  Tab(text: 'Science'),
                  Tab(text: 'Sports'),
                  Tab(text: 'Technology'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good $timeOfDay!',
                      style: kSubHeadLStyle,
                    ),
                    Text('News Tailored Just for You',
                        style: GoogleFonts.robotoMono(
                          wordSpacing: -1.5,
                          height: 1.5,
                          fontSize: 14,
                          color: Colors.black54,
                          //fontWeight: FontWeight.w900
                        )),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    HomeCard(
                        apiEndpoint:
                            'https://newsapi.org/v2/top-headlines?language=en&apiKey=54b505aed2a24b23805e068284d0f24c'),
                    HomeCard(
                        apiEndpoint:
                            'https://newsapi.org/v2/top-headlines?language=en&category=business&apiKey=54b505aed2a24b23805e068284d0f24c'),
                    HomeCard(
                        apiEndpoint:
                            'https://newsapi.org/v2/top-headlines?language=en&category=entertainment&apiKey=54b505aed2a24b23805e068284d0f24c'),
                    HomeCard(
                        apiEndpoint:
                            'https://newsapi.org/v2/top-headlines?language=en&category=health&apiKey=54b505aed2a24b23805e068284d0f24c'),
                    HomeCard(
                        apiEndpoint:
                            'https://newsapi.org/v2/top-headlines?language=en&category=science&apiKey=54b505aed2a24b23805e068284d0f24c'),
                    HomeCard(
                        apiEndpoint:
                            'https://newsapi.org/v2/top-headlines?language=en&category=sports&apiKey=54b505aed2a24b23805e068284d0f24c'),
                    HomeCard(
                        apiEndpoint:
                            'https://newsapi.org/v2/top-headlines?language=en&category=technology&apiKey=54b505aed2a24b23805e068284d0f24c'),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BannerAd()),
    );
  }
}
