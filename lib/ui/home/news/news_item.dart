import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:news_app/model/NewsResponce.dart';
import 'package:news_app/utils/App_Colors.dart';
import 'package:news_app/utils/App_styles.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String timeAgo = "";
    if (news.publishedAt != null && news.publishedAt!.isNotEmpty) {
      try {
        DateTime publishedDate = DateTime.parse(news.publishedAt!);
        timeAgo = GetTimeAgo.parse(publishedDate);
      } catch (e) {
        timeAgo = "Invalid date";
      }
    }
    return Container(
      margin: EdgeInsets.only(
          left: width * 0.04, right: width * 0.04, top: height * .018),
      padding: EdgeInsets.symmetric(
          horizontal: height * 0.009, vertical: width * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).indicatorColor, width: 2),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: AppColors.grey,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: height * .011,
          ),
          Text(news.title ?? "",
              style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(
            height: height * .011,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                "By: ${news.author ?? ""}",
                style: AppStyles.mediuem12Grey,
              )),
              Text(timeAgo, style: AppStyles.mediuem12Grey)
            ],
          )
        ],
      ),
    );
  }
}
