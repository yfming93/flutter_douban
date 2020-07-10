import 'package:flutter/material.dart';
import 'package:flutter_douban/model/home_model.dart';
import 'package:flutter_douban/pages/home/home_movie_item.dart';
import 'package:flutter_douban/service/home_request.dart';

class FMHomeContent extends StatefulWidget {
  @override
  _FMHomeContentState createState() => _FMHomeContentState();
}

class _FMHomeContentState extends State<FMHomeContent> {
  final List<MovieItem> movies = [];


  @override
  void initState() {
    super.initState();
    HomeRequest.requestMovieList(0).then((res){
      setState(() {
        movies.addAll(res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder:(ctx,index){
          return FMHomeMovieItem(movies[index]);
        } ,
      ),
    );
  }
}
