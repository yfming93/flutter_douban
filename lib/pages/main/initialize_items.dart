import 'package:flutter_douban/pages/home/home.dart';
import 'package:flutter_douban/pages/subject/subject.dart';

import 'bottom_bar_item.dart';
import 'package:flutter/material.dart';

List<FMBottomBarItem> items = [
  FMBottomBarItem("home","首页"),
  FMBottomBarItem("subject","书影音"),
  FMBottomBarItem("group","小组"),
  FMBottomBarItem("mall","市集"),
  FMBottomBarItem("profile","我的"),
];

List<Widget> pages = [
  FMHomePage(),
  FMSubjectPage(),
  FMHomePage(),
  FMHomePage(),
  FMHomePage(),
  FMHomePage(),
];
