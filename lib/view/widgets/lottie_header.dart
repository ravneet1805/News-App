import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LottieRefreshHeader extends StatelessWidget {
  const LottieRefreshHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClassicHeader(
      refreshingIcon: SizedBox(
        //width: 50,
        height: 70,
        child: Lottie.asset('assets/images/rover.json'),
      ),
      // completeIcon: SizedBox(
      //   //width: 50,
      //   height: 200,
      //   child: Lottie.asset('assets/images/rover.json'),
      // ),
      failedText: 'Refresh failed!',
      completeText: 'Refresh complete!',
      releaseText: 'Release to refresh',
      refreshingText: 'Refreshing...',
    );
  }
}
