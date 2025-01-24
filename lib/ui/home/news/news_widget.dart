import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/SourceResponce.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/utils/App_Colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // loading
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.grey,
              ),
            );
          } else if (snapshot.hasError) {
            // error from client
            return Center(
              child: Column(
                children: [
                  Text("Something went wrong"),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsBySourceId(widget.source.id ?? "");
                        setState(() {});
                      },
                      child: Text("Try again"))
                ],
              ),
            );
          }

          // now iam sure that there is a response but there are two states (error , ok)
          // error
          if (snapshot.data!.status != "ok") {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data!.message!),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsBySourceId(widget.source.id ?? "");
                        setState(() {});
                      },
                      child: Text("Try again"))
                ],
              ),
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        });
  }
}
