import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    required this.icon,
    this.index = 0,
    this.isSelected = false,
    this.animationController,
  });

  Icon icon;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      icon: Icon(Icons.home_outlined),
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      icon: Icon(Icons.search_outlined),
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      icon: Icon(Icons.file_download_outlined),
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      icon: Icon(Icons.rss_feed_outlined),
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}