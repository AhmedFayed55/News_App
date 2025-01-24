import 'package:flutter/material.dart';
import 'package:news_app/ui/home/drawer/custom_row.dart';
import 'package:news_app/utils/App_Colors.dart';
import 'package:news_app/utils/App_styles.dart';
import 'package:news_app/utils/Assets_manager.dart';

class DrawerWidget extends StatelessWidget {
  Function onDrawerRowClick;

  DrawerWidget({required this.onDrawerRowClick});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: height * .20,
          color: AppColors.white,
          alignment: Alignment.center,
          child: Text(
            "News App",
            style: AppStyles.bold24black,
          ),
        ),
        InkWell(
            onTap: () {
              onDrawerRowClick();
            },
            child: CustomRow(
                text: "Go To Home", iconImagePath: AssetsManager.homeIcon)),
        Divider(
          color: AppColors.grey,
          indent: width * .04,
          endIndent: width * .04,
        ),
        CustomRow(text: "Theme", iconImagePath: AssetsManager.themeIcon),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.040, vertical: height * .005),
          margin: EdgeInsets.only(
              left: width * 0.040, right: width * 0.040, bottom: height * .015),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.white,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Light",
                style: AppStyles.mediuem20White,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.white,
                  )),
            ],
          ),
        ),
        Divider(
          color: AppColors.grey,
          indent: width * .04,
          endIndent: width * .04,
        ),
        CustomRow(text: "Language", iconImagePath: AssetsManager.languageIcon),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.040, vertical: height * .005),
          margin: EdgeInsets.only(
              left: width * 0.040, right: width * 0.040, bottom: height * .015),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.white,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "English",
                style: AppStyles.mediuem20White,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.white,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
