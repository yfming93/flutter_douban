import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_douban/widgets/dashed_line.dart';
import 'package:flutter_douban/widgets/star_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('豆瓣App'),
      ),
      body: Center(
        child: Text("hello world"),
      ),
    );
  }
}



