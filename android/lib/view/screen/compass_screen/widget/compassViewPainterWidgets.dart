import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CompassViewPainter extends CustomPainter {
  final Color color;
  final double cardinalityFontSize;
  final double majorScaleFontSize;
  final double qiblaPositon;
  final ui.Image? image;
  final int mejorTrickerCount;
  final int minorTrickerCount;
  final CardinalityMap cardinalityMap;

  CompassViewPainter( { this.image, this.qiblaPositon=0.0,required this.color,
    this.cardinalityFontSize = 20,
    this.majorScaleFontSize = 12,
    this.mejorTrickerCount = 18,
    this.minorTrickerCount = 90,
    this.cardinalityMap = const {0:'N',90:'E',180:'S',270:'W'}
  }
    );

late final majorScalePaint=Paint()
  ..style=PaintingStyle.stroke
  ..color=color
  ..strokeWidth=2.0;

  late final minorScalePaint=Paint()
    ..style=PaintingStyle.stroke
    ..color=color.withOpacity(0.7)
    ..strokeWidth=1.0;

  late final majorScaleStyle=TextStyle(
    color: color,
    fontSize: majorScaleFontSize
  );

  late final cardinalityStyle=TextStyle(
      color: Colors.white70,
      fontSize: cardinalityFontSize,
    fontWeight: FontWeight.bold
  );


  late final _majorTicks=_layoutScale(mejorTrickerCount);
  late final _minorTicks=_layoutScale(minorTrickerCount);
  late final _angleDegree=_layoutAngleScale(_majorTicks);

  @override
  void paint(Canvas canvas, Size size) {
    const origin=Offset.zero;
    final center=size.center(origin);
    final radius=size.width/2;

    final majorTickLength=size.width*0.08;
    final minorTickLength=size.width*0.053;

    canvas.save();
    // major  paint
    for(final angel in _majorTicks){
      final tickStart=Offset.fromDirection(_correctAngle(angel).toRadius()  ,radius);
      final tickEnd=Offset.fromDirection(_correctAngle(angel).toRadius(),radius-majorTickLength);

      canvas.drawLine(center+tickStart,center+ tickEnd, majorScalePaint);
    }

    // MINOR  paint
    for(final angel in _minorTicks){
      final tickStart=Offset.fromDirection(_correctAngle(angel).toRadius()  ,radius);
      final tickEnd=Offset.fromDirection(_correctAngle(angel).toRadius(),radius-minorTickLength);

      canvas.drawLine(center+tickStart,center+ tickEnd, minorScalePaint);
    }
    // angle  paint
    for(final angel in _angleDegree){
      final textPadding=majorTickLength-size.width*0.02;
        final textPainter=TextSpan(
          text: angel.toStringAsFixed(0),
          style: majorScaleStyle,
        ).toPainter()..layout();

        final layoutOffset=Offset.fromDirection(_correctAngle(angel).toRadius(),radius-textPadding,);
        final offset=center+layoutOffset;

        canvas.restore();
        canvas.save();
        
        canvas.translate(offset.dx, offset.dy);
        canvas.rotate(angel.toRadius());
        canvas.translate(-offset.dx, -offset.dy);


        textPainter.paint(canvas, Offset(offset.dx-(textPainter.width/2),offset.dy));
    }



    // cardinality  paint
    for(final cardinality in cardinalityMap.entries){
      final textPadding=majorTickLength+size.width*0.02;
      final angle=cardinality.key.toDouble();
      final text=cardinality.value;


      final textPainter=TextSpan(
        text: text,
        style: cardinalityStyle.copyWith(color: text=="N"?Colors.red:null),
      ).toPainter()..layout();

      final layoutOffset=Offset.fromDirection(_correctAngle(angle).toRadius(),radius-textPadding,);
      final offset=center+layoutOffset;

      canvas.restore();
      canvas.save();

      canvas.translate(offset.dx, offset.dy);
      canvas.rotate(angle.toRadius());
      canvas.translate(-offset.dx, -offset.dy);


      textPainter.paint(canvas, Offset(offset.dx-(textPainter.width/2),offset.dy));
    }











    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  List<double> _layoutScale(int ticks){
   final scale=360/ticks;
   return List.generate(ticks, (index) => index*scale);
  }

  List<double> _layoutAngleScale(List<double> ticks){
   List<double> angle=[];
   for(var i=0;i<ticks.length;i++){
     if(i==ticks.length-1){
       double degreeVal=(ticks[i]+360)/2;
       angle.add(degreeVal);
     }else{
       double degreeval=(ticks[i]+ticks[i+1])/2;
       angle.add(degreeval);

     }
   }
   return angle;
  }


  double _correctAngle(double angle)=>angle-90;
}
typedef CardinalityMap=Map<num,String>;

extension on TextSpan{
  TextPainter toPainter({TextDirection textDirection=TextDirection.ltr})=>TextPainter(text: this,textDirection: textDirection);
}
extension on num{
  double toRadius()=>this * pi/180;
}