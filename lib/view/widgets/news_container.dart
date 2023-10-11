import 'package:flutter/material.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:newsapp/view/widgets/button.dart';

class NewsContainer extends StatefulWidget {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsUrl;
  NewsContainer(
      {Key? key,
      required this.imgUrl,
      required this.newsHead,
      required this.newsDesc,
      required this.newsUrl})
      : super(key: key);

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  bool detail = true;

  void ToggleDetail() {
    setState(() {
      detail = !detail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (detail)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SizedBox(height: 80,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(widget.imgUrl, fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    widget.newsHead,
                    style: kHeadingStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomButton(text: 'Read More', toggle: ToggleDetail)
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.newsDesc,
                  style: kDescriptionStyle,
                  textAlign: TextAlign.center,
                ),
                CustomButton(text: 'Back', toggle: ToggleDetail),
              ],
            ),
    );
  }
}
