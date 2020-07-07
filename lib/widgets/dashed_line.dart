import 'package:flutter/material.dart';

class FMDashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  FMDashedLine({
    this.axis = Axis.horizontal,
    this.dashedWidth = 1,
    this.dashedHeight = 1,
    this.count = 10,
    this.color = Colors.red
  });
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (_){
        return SizedBox(
          width: dashedWidth,
          height: dashedHeight,
          child: DecoratedBox(
              decoration: BoxDecoration(  color: color  )
          ),
        );
      }),
    );
  }
}

/*
* Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: FMDashedLine(dashedWidth: 5,color: Colors.green,count: 15,),
            ),

            SizedBox(height: 30,),
            Container(
              height: 200,
              child: FMDashedLine(dashedHeight: 5,color: Colors.green,count: 15,axis: Axis.vertical,),
            ),
          ],
        ),
* */
