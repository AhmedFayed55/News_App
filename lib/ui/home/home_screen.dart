import 'package:flutter/material.dart';
import 'package:news_app/model/category_fragment_model.dart';
import 'package:news_app/ui/home/category_details/category_fragment.dart';
import 'package:news_app/utils/App_Colors.dart';

import 'category_details/category_details.dart';
import 'drawer/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home_Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory == null ? "Home" : selectedCategory!.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        drawer: Drawer(
          backgroundColor: AppColors.black,
          child: DrawerWidget(
            onDrawerRowClick: onDrawerRowClick,
          ),
        ),
        body: selectedCategory == null
            ? CategoryFragment(
                onViewAllClick: onViewAllClick,
              )
            : CategoryDetails(
                category: selectedCategory!,
              ));
  }

  CategoryModel? selectedCategory;

  void onViewAllClick(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerRowClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
