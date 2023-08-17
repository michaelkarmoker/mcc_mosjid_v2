import 'package:mccs_masjid/view/screen/compass_screen/widget/topGradiantContainer.dart';
import 'package:flutter/cupertino.dart';


import 'app_color.dart';
import 'neumorphism.dart';

class CompassDisplay extends StatelessWidget {
  final size;
  const CompassDisplay({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return   Neumorphism(
        margin: EdgeInsets.all(size.width*0.17),
        distance: 2.5 ,
        blur: 5,
        child:Neumorphism(
          margin: EdgeInsets.all(size.width*0.01),
          distance: 0 ,
          innerShadow: true,
          isReserve: true,
          blur: 0, child: Neumorphism(
          margin: EdgeInsets.all(size.width*0.05),
          distance: 4 ,
          blur: 5,
          child: TopGradiantContainer(
              padding: EdgeInsets.all(size.width*0.02),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.greenColor,
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment(-5,-5),
                        end: Alignment.bottomRight,

                        colors: [
                          AppColor.greenDarkColor,
                          AppColor.greenColor
                        ]

                    )
                ),

              )),

        ),
        ) );
  }
}
