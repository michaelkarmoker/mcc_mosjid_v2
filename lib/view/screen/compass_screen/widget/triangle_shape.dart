import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrianglePainter extends CustomClipper<Path> {
    final bool isReverse;
    final double centerRoundSize;
  TrianglePainter({required this.isReverse, this.centerRoundSize=10});
  @override
  Path getClip(Size size) {
    final path=Path();
    if(isReverse){
      path.lineTo(size.width/2, size.height);
      path.lineTo(0, 0);
      path.lineTo(size.width/2-6, 0);
      path.quadraticBezierTo(size.width/2,centerRoundSize,(size.width/2)+(centerRoundSize/2),0);
      path.lineTo(size.width,0);
      path.lineTo(size.width/2, size.height);
      path.close();
    }else{
      path.lineTo(size.width/2, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width/2-6, size.height);
      path.quadraticBezierTo(size.width/2, size.height-centerRoundSize,(size.width/2)+(centerRoundSize/2),size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width/2,0);
      path.close();
    }


    return path;
  }

    @override
    bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
      // TODO: implement shouldReclip
      return false;
    }
}