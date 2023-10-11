import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/constants.dart';

class WebDetail extends StatefulWidget {
  String url;
  WebDetail({super.key, required this.url});

  @override
  State<WebDetail> createState() => _WebDetailState();
}

class _WebDetailState extends State<WebDetail> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            Text('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            Text('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url)); // Access 'url' from the widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        iconTheme: const IconThemeData(color: kTextColor),
        title: Text(
          "CometNews",
          style: kHeadingStyle,
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: (isLoading)
          ? Center(child: Lottie.asset('assets/images/loader.json', height: 60))
          : WebViewWidget(controller: controller),
    );
  }
}
