import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponce.dart';
import 'package:news_app/utils/App_styles.dart';

class SourceNameWidget extends StatelessWidget {
  bool isSelected;
  Source source;

  SourceNameWidget({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(source.name ?? "",
        style: isSelected ? AppStyles.bold16black : AppStyles.mediuem14black);
  }
}
