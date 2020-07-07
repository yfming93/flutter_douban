import 'package:flutter/material.dart';

class FMStarRating extends StatefulWidget {

  final double rating; // 当前分
  final double maxRating; // 满分
  final int count; // 全部需要几个星星
  final double size; // 星星大小
  final Color unselectedColor; // 未选中颜色
  final Color selectedColor;// 选中颜色
  final Widget selectedImage;
  final Widget unselectedImage;


  FMStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget selectedImage,
    Widget unselectedImage,
  }): unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unselectedColor, size: size,),
        selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size,);

  @override
  _FMStarRatingState createState() => _FMStarRatingState();
}

class _FMStarRatingState extends State<FMStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnselectedStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectedStar(),
        ),
      ],
    );
  }

  List<Widget> buildUnselectedStar(){
    return List.generate(widget.count, (index){
      return widget.unselectedImage;
    });
  }


  List<Widget> buildSelectedStar(){
    List<Widget> stars = [];
    final star = widget.selectedImage;
    /// 构建满星星
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    for (var i =0; i < entireCount; i++){
      stars.add(star);
    }
    /// 部分裁剪
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final halfStar = ClipRect(
      child: star,
      clipper: FMStarClipper(leftWidth),
    );
    stars.add(halfStar) ;
    if (stars.length > widget.count){
      stars = stars.sublist(0,widget.count);
    }
    return stars;
  }
}

class FMStarClipper extends CustomClipper<Rect> {
  double width;
  FMStarClipper(this.width);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }
  @override
  bool shouldReclip(FMStarClipper oldClipper) {
    return oldClipper.width != this.width; // 就的裁剪星星宽度和新传入的不一样就要裁剪
  }
}