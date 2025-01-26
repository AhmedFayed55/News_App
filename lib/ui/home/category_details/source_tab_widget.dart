import 'package:flutter/material.dart';
import 'package:news_app/ui/home/category_details/source_name_widget.dart';
import 'package:news_app/ui/home/news/news_widget.dart';
import 'package:news_app/utils/App_Colors.dart';

import '../../../model/SourceResponce.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourceList;

  SourceTabWidget({required this.sourceList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
                indicatorColor: Theme.of(context).indicatorColor,
                dividerColor: AppColors.transparent,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabs: widget.sourceList.map((source) {
                  return SourceNameWidget(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source));
                }).toList()),
            Expanded(
                child: NewsWidget(source: widget.sourceList[selectedIndex])),
          ],
        ));
  }
}
