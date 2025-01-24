import 'package:news_app/utils/Assets_manager.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;

  CategoryModel(
      {required this.id, required this.title, required this.imagePath});

  //

  static List<CategoryModel> getCategoriesList() {
    return [
      CategoryModel(
          id: "general",
          title: "General",
          imagePath: AssetsManager.generalImageDark),
      CategoryModel(
          id: "business",
          title: "Business",
          imagePath: AssetsManager.businessImageDark),
      CategoryModel(
          id: "sports",
          title: "Sports",
          imagePath: AssetsManager.sportImageDark),
      CategoryModel(
          id: "technology",
          title: "Technology",
          imagePath: AssetsManager.tecnologyImageDark),
      CategoryModel(
          id: "entertainment",
          title: "Entertainment",
          imagePath: AssetsManager.entertainmentImageDark),
      CategoryModel(
          id: "health",
          title: "Health",
          imagePath: AssetsManager.healthImageDark),
      CategoryModel(
          id: "science",
          title: "Science",
          imagePath: AssetsManager.scienceImageDark),
    ];
  }
}
