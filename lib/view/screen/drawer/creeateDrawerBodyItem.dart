
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      padding: EdgeInsets.only(left:10,top:15,bottom: 15,right: 5),
      child: Row(

        children: <Widget>[
          Image.asset(icon,width: 20,height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(text,style: robotoMedium.copyWith(color:Color(0xff55566A),fontSize: Dimensions.fontSizeDefault),),
          ),

        ],
      ),
    ),
  );
}
