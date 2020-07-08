import 'package:flutter/material.dart';

class FMHomeContent extends StatefulWidget {
  @override
  _FMHomeContentState createState() => _FMHomeContentState();
}

class _FMHomeContentState extends State<FMHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("首页",style: TextStyle(color: Colors.green, fontSize: 30),),
    );
  }
}
