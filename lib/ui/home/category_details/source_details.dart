import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/category_fragment_model.dart';
import 'package:news_app/ui/home/category_details/cubit/source_details_view_model.dart';
import 'package:news_app/ui/home/category_details/cubit/source_states.dart';
import 'package:news_app/ui/home/category_details/source_tab_widget.dart';
import 'package:news_app/utils/App_Colors.dart';

import '../../../di/di.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;
  ApiManager apiManager = ApiManager();

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceDetailsViewModel sourceViewModel = SourceDetailsViewModel(
      sourceRepositoryContract: injectSourceSourceRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sourceViewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sourceViewModel,
      child: BlocBuilder<SourceDetailsViewModel, SourceState>(
          builder: (context, state) {
        if (state is SourceLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.grey,
            ),
          );
        } else if (state is SourceErrorState) {
          return Column(
            children: [
              Text(state.errorMessage),
              ElevatedButton(
                  onPressed: () {
                    widget.apiManager.getSources(widget.category.id);
                    setState(() {});
                  },
                  child: Text("Try Again"))
            ],
          );
        } else if (state is SourceSuccessState) {
          return SourceTabWidget(sourceList: state.sourcesList);
        }
        return Container();
      }),
    );

    // FutureBuilder<SourceResponce?>(
    //     future: ApiManager.getSources(widget.category.id),
    //     builder: (contxt, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         // Loading
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.grey,
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         // Error from client
    //         return Column(
    //           children: [
    //             const Text("Something went wrong"),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getSources(widget.category.id);
    //                   setState(() {});
    //                 },
    //                 child: Text("Try Again"))
    //           ],
    //         );
    //       }
    //       // now iam sure that there is a response but there are two states (error , ok)
    //       // error
    //       if (snapshot.data!.status != "ok") {
    //         return Column(
    //           children: [
    //             Text(snapshot.data!.message!),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getSources(widget.category.id);
    //                   setState(() {});
    //                 },
    //                 child: Text("Try Again"))
    //           ],
    //         );
    //       }
    //       // ok
    //       var sourceList = snapshot.data!.sources ?? [];
    //       return SourceTabWidget(sourceList: sourceList);
    //     });
  }
}
