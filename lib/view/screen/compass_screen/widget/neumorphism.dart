import 'package:qibla_finder/view/screen/compass_screen/widget/topGradiantContainer.dart';
import 'package:flutter/cupertino.dart';

import '../../../../util/styles.dart';

class Neumorphism extends StatelessWidget {

  final Widget child;
  final double distance;
  final double blur;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool  isReserve;
  final bool innerShadow;


  const Neumorphism({super.key,
    required this.child,
     this.distance=0,
     this.blur=0,
    this.margin,
    this.padding,
     this.isReserve=false,
     this.innerShadow=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color:compassPrimaryColor,
        shape: BoxShape.circle,
        boxShadow:isReserve? [
          BoxShadow(
            color: compassPrimaryDarkColor,
            blurRadius: blur,
            offset: Offset(-distance,-distance),

          ),
          BoxShadow(
            color:whiteColor,
            blurRadius: blur,
            offset: Offset(distance,distance),

          ),
        ]:[
          BoxShadow(
            color:whiteColor,

            blurRadius: blur,
            offset: Offset(-distance,-distance),

          ),
          BoxShadow(
            color: compassPrimaryDarkColor,
            blurRadius: blur,
            offset: Offset(distance,distance),

          ),
        ]
      ),
      child: innerShadow?TopGradiantContainer(child: child,):child
    );
  }
}
