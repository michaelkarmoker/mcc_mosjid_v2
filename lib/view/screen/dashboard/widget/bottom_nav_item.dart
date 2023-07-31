


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';


class BottomNavItem extends StatelessWidget {
  // final IconData iconData;
  final String? iconData;
  final String? title;
  final Function()? onTap;
  final bool isSelected;
  final double height;
  BottomNavItem({ this.iconData, this.onTap, this.isSelected = false,required this.height, this.title});

  @override
  Widget build(BuildContext context) {
    double heightp=height+2;
    return Expanded(
      child: IconButton(
          padding: EdgeInsets.all(2),
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(iconData!, height:height,color: isSelected?Colors.amber:Colors.amber.withOpacity(0.3),),
          SizedBox(height: 3,),
            title!=null?Text(title!,style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: isSelected?Colors.amber:Colors.amber.withOpacity(0.3)),):SizedBox()
          ],
        ),
        onPressed: onTap,
      ),
    );
  }
}
//0xFFDCDCDC