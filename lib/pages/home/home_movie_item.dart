import 'package:flutter/material.dart';
import 'package:flutter_douban/model/home_model.dart';
import 'package:flutter_douban/utils/FMLog.dart';
import 'package:flutter_douban/widgets/dashed_line.dart';
import 'package:flutter_douban/widgets/star_rating.dart';

class FMHomeMovieItem extends StatelessWidget {
  final MovieItem movie;

  FMHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          width: 10,
          color: Color(0xffdddddd),
        ),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeaderRank(),
          SizedBox(
            height: 8,
          ),
          buildContent(),
          SizedBox(
            height: 8,
          ),
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildHeaderRank() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Color.fromARGB(255, 238, 205, 144),
      ),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(color: Colors.blueGrey, fontSize: 18),
      ),
    );
  }

  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(
          width: 8,
        ),
        buildContentInfo(),
        SizedBox(
          width: 8,
        ),
        buildContentLine(),
        SizedBox(
          width: 8,
        ),
        buildContentWish(),
      ],
    );
  }

  // 2.1内容图片
  Widget buildContentImage() {
    return ClipRRect(
      child: Image.network(
        movie.imageURL,
        height: 150,
      ),
      borderRadius: BorderRadius.circular(4),
    );
  }

  // 2.2内容信息
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          SizedBox(
            height: 8,
          ),
          buildContentRate(),
          SizedBox(
            height: 8,
          ),
          buildContentInfoDesc(),
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    List<InlineSpan> spans = [];

    spans.add(WidgetSpan(
        child: Icon(
          Icons.play_circle_outline,
          color: Colors.redAccent,
          size: 24,
        ),
        alignment: PlaceholderAlignment.middle));
    spans.addAll(movie.title.runes.map((rune) {
      return WidgetSpan(
          child: Text(String.fromCharCode(rune),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          alignment: PlaceholderAlignment.middle);
    }));

    spans.add(WidgetSpan(
        child: Text("(${movie.playDate})",
            style: TextStyle(fontSize: 16, color: Colors.grey)),
        alignment: PlaceholderAlignment.middle));

    return Text.rich(TextSpan(children: spans));
  }

  Widget buildContentRate() {
    return Row(
      children: <Widget>[
        FMStarRating(
          rating: movie.rating,
          size: 20,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          "${movie.rating}",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        )
      ],
    );
  }

  Widget buildContentInfoDesc() {
    final genresString = movie.genres.join(" ");
    final directorString = movie.director.name;
    final castsString = movie.casts.map((item) => item.name).join(" ");
    fmlog("message111", StackTrace.current);
    return Text(
      "$genresString / $directorString / $castsString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  //2.3line
  Widget buildContentLine() {
    return Container(
      height: 100,
      child: FMDashedLine(
        axis: Axis.vertical,
        dashedWidth: 0.5,
        dashedHeight: 6,
        count: 10,
        color: Colors.redAccent,
      ),
    );
  }

  //2.3想看
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/home/wish.png",
            width: 45,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "想看",
            style: TextStyle(fontSize: 16, color: Colors.orangeAccent),
          )
        ],
      ),
    );
  }

  // 3 尾部
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(4)),
      child: Text(
        movie.originalTitle,
        style: TextStyle(fontSize: 20, color: Color(0xff666666)),
      ),
    );
  }
}
