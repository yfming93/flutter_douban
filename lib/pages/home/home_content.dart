import 'package:flutter/material.dart';

class FMHomeContent extends StatefulWidget {
  @override
  _FMHomeContentState createState() => _FMHomeContentState();
}

class _FMHomeContentState extends State<FMHomeContent> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 30,
        itemBuilder:(ctx,index){
          return ListTile(title: Text("data"),);
        } ,
      ),
    );
  }
}
