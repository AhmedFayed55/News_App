import 'package:flutter/material.dart';
import 'package:news_app/utils/App_styles.dart';

class CustomRow extends StatelessWidget {
  String iconImagePath;
  String text;

  CustomRow({required this.text, required this.iconImagePath});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.040, vertical: height * .025),
      child: Row(
        children: [
          Image.asset(iconImagePath),
          SizedBox(
            width: width * .04,
          ),
          Text(
            text,
            style: AppStyles.bold20White,
          )
        ],
      ),
    );
  }
}
