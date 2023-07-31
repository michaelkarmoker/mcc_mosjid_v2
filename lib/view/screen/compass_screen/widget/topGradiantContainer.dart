import 'package:flutter/cupertino.dart';

import 'app_color.dart';


class TopGradiantContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
   TopGradiantContainer({super.key, required this.child, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: margin,
      padding: padding,
      child: child,
      decoration:  BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              AppColor.primaryDarkColor,
              AppColor.blackColor
            ],

          )
      ),
    );
  }
}
