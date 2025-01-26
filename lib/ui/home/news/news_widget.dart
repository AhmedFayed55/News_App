import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/SourceResponce.dart';
import 'package:news_app/ui/home/news/cubit/news_states.dart';
import 'package:news_app/ui/home/news/cubit/news_view_model.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/utils/App_Colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id!);
  }

  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.source.id != oldWidget.source.id) {
      viewModel.getNews(widget.source.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.grey,
            ),
          );
        } else if (state is NewsErrorState) {
          return Center(
            child: Column(
              children: [
                Text(state.errorMessage),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getNews(widget.source.id ?? "");
                    },
                    child: Text("Try again"))
              ],
            ),
          );
        } else if (state is NewsSuccessState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: state.newsList[index]);
            },
            itemCount: state.newsList.length,
          );
        }
        return Container();
      }),
    );
    // FutureBuilder(
    //   future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       // loading
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: AppColors.grey,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       // error from client
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text("Something went wrong"),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getNewsBySourceId(widget.source.id ?? "");
    //                   setState(() {});
    //                 },
    //                 child: Text("Try again"))
    //           ],
    //         ),
    //       );
    //     }
    //
    //     // now iam sure that there is a response but there are two states (error , ok)
    //     // error
    //     if (snapshot.data!.status != "ok") {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.data!.message!),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getNewsBySourceId(widget.source.id ?? "");
    //                   setState(() {});
    //                 },
    //                 child: Text("Try again"))
    //           ],
    //         ),
    //       );
    //     }
    //     var newsList = snapshot.data!.articles!;
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return NewsItem(news: newsList[index]);
    //       },
    //       itemCount: newsList.length,
    //     );
    //   });
  }
}
