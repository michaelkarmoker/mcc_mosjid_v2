
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../util/dimensions.dart';
import '../../../util/styles.dart';



Widget createDrawerBodyItem(
    {required String icon, required String text, required GestureTapCallback onTap}) {
  return InkWell(
    onTap: ()=>onTap(),
    child: Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey,width: 0.5))
      ),

      padding: EdgeInsets.only(left:2.w,top:1.5.h,bottom: 1.5.h,),
      child: Row(

        children: <Widget>[
          Image.asset(icon,width: 5.w,height: 5.w,),
          Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: Text(text,style: robotoMedium.copyWith(color:Color(0xff55566A),fontSize: 10.sp),),
          ),

        ],
      ),
    ),
  );
}
