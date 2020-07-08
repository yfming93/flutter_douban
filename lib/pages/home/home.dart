import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/home/home_content.dart';



class FMHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body:FMHomeContent()
    );
  }
}
