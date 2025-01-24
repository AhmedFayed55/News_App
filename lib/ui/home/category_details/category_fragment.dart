import 'package:flutter/material.dart';
import 'package:news_app/model/category_fragment_model.dart';
import 'package:news_app/utils/App_Colors.dart';
import 'package:news_app/utils/App_styles.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryModel.getCategoriesList();
  Function onViewAllClick;

  CategoryFragment({required this.onViewAllClick});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: AppStyles.mediuem20black,
          ),
          SizedBox(
            height: height * .008,
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: height * .01,
              );
            },
            itemBuilder: (context, index) {
              return Stack(
                alignment: index % 2 == 0
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(categoriesList[index].imagePath),
                  ),
                  InkWell(
                    onTap: () {
                      onViewAllClick(categoriesList[index]);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: width * .02),
                      margin: index % 2 == 0
                          ? EdgeInsets.only(
                              right: width * .040, bottom: height * .019)
                          : EdgeInsets.only(
                              left: width * .040, bottom: height * .019),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.grey,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "View All",
                            style: AppStyles.mediuem20black,
                          ),
                          SizedBox(
                            width: width * .02,
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.white,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: categoriesList.length,
          ))
        ],
      ),
    );
  }
}
