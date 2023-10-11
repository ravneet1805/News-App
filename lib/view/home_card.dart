import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/view/web_view.dart';
import 'package:newsapp/view/widgets/lottie_header.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

import '../data/fetchdata.dart';
import '../data/news.dart';
import '../utils/constants.dart';

class HomeCard extends StatefulWidget {
  final String apiEndpoint;
  const HomeCard({Key? key, required this.apiEndpoint}) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  late Future<List<News>> _newsFuture;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool show = false;
  int count = 0;
  bool isLoading = false;

  void fetchData() {
    Future.delayed(const Duration(milliseconds: 1940), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  String calculateTimeDifference(String apiTime) {
    DateTime apiDateTime = DateTime.parse(apiTime);
    DateTime now = DateTime.now();

    Duration difference = now.difference(apiDateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }

  Future<void> _refreshNews() async {
    try {
      // Fetch news data again when the user performs the refresh action
      final refreshedNews = await FetchNews.fetchNewsList(widget.apiEndpoint);

      refreshedNews.shuffle();

      setState(() {
        _newsFuture = Future.value(refreshedNews);
      });
    } catch (error) {
      // Handle any errors that occur during the refresh
      print('Error refreshing news: $error');
    } finally {
      refreshController.refreshCompleted();
    }
  }

  void loadInterstitialAd() async {
    try {
      // Check if Unity Ads is initialized
      UnityAds.load(
        placementId: 'Interstitial_Android',
        onComplete: (placementId) => print('Load Complete $placementId'),
        onFailed: (placementId, error, message) =>
            print('Load Failed $placementId: $error $message'),
      );
    } catch (e) {
      print("Error showing interstitial ad: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    loadInterstitialAd();
    _newsFuture = FetchNews.fetchNewsList(widget.apiEndpoint);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? Center(
              child: Lottie.asset('assets/images/loader.json',
                  height: 60)) // Show the loading indicator
          : Center(
              child: SmartRefresher(
                header: const LottieRefreshHeader(),
                onRefresh: _refreshNews,
                controller: refreshController,
                enablePullDown: true,
                child: FutureBuilder<List<News>>(
                  future: _newsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: Lottie.asset('assets/images/loader.json',
                              height: 60));
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          'Error occurred while fetching news.\nPull Down to Refresh',
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          'No news available',
                          style: TextStyle(color: kTextColor),
                        ),
                      ); // Handle empty or null data
                    } else {
                      final newsList = snapshot.data!;

                      return Center(
                        child: CardSwiper(
                          padding: const EdgeInsets.all(20),
                          cardsCount: newsList.length,
                          numberOfCardsDisplayed: 4,
                          onSwipe: (previousIndex, currentIndex, direction) {
                            setState(() {
                              count++;
                              show = false;
                            });
                            return true;
                          },
                          cardBuilder: (context, index, percentThresholdX,
                              percentThresholdY) {
                            final news = newsList[index];
                            String apiTime = news.time;
                            String formattedTime =
                                calculateTimeDifference(apiTime);

                            if (count == 10) {
                              loadInterstitialAd();
                              print("Showingggggg addddddddddddddddd");
                              UnityAds.showVideoAd(
                                placementId: 'Interstitial_Android',
                                onStart: (placementId) =>
                                    print('Video Ad $placementId started'),
                                onClick: (placementId) =>
                                    print('Video Ad $placementId click'),
                                onSkipped: (placementId) =>
                                    print('Video Ad $placementId skipped'),
                                onComplete: (placementId) =>
                                    print('Video Ad $placementId completed'),
                                onFailed: (placementId, error, message) => print(
                                    'Video Ad $placementId failed: $error $message'),
                              );
                              count = 0;
                            }

                            return GestureDetector(
                              onTap: () {
                                print('index=== $index');

                                setState(() {
                                  show = !show;
                                });
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black, // Border color
                                    width: 2.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  color: kSecondaryColor
                                  //Color(0xffcee8ff)
                                  ,
                                ),
                                child: show
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              news.newsDesc,
                                              style: kCardDescriptionStyle,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          WebDetail(
                                                            url: news.url,
                                                          )));
                                            },
                                            child: Container(
                                              height: 40,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Read More',
                                                  style: GoogleFonts.raleway(
                                                      fontSize: 12,
                                                      color: kSecondaryColor,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(news.name,
                                                        style: kSubHeadStyle),
                                                    Text(
                                                        news.author
                                                            .split(',')[0]
                                                            .trim(),
                                                        style:
                                                            kDescriptionStyle),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(),
                                              Text(formattedTime,
                                                  textAlign: TextAlign.center,
                                                  style: kDescriptionStyle),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                                child: (news.imgUrl.isEmpty)
                                                    ? Image.asset(
                                                        'assets/images/moon.png',
                                                        height: 80,
                                                      )
                                                    : Image.network(
                                                        news.imgUrl,
                                                        height: 200,
                                                      )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(news.newsHead,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 5,
                                                style: kHeadingStyle),
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
    );
  }
}
