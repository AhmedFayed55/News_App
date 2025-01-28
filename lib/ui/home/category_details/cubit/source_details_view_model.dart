import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/repository/sources/repository/source_repository_contract.dart';
import 'package:news_app/ui/home/category_details/cubit/source_states.dart';

class SourceDetailsViewModel extends Cubit<SourceState> {
  SourceRepositoryContract sourceRepositoryContract;

  SourceDetailsViewModel({required this.sourceRepositoryContract})
      : super(SourceLoadingState());

  // don't forget todo: hold data - handle logic

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await sourceRepositoryContract.getSources(categoryId);
      if (response!.status == "error") {
        emit(SourceErrorState(errorMessage: response.message!));
      } else {
        emit(SourceSuccessState(sourcesList: response.sources!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
