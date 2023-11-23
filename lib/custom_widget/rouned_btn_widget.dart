
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui_helper.dart';

class RounededBtn extends StatelessWidget {
  double mWidth;
  double mHight;
  String title;
  Color mColor;
  VoidCallback onpress;
  IconData? mIcon;
  double borderRadius;

  RounededBtn(
      {required this.onpress,
        required this.title,
        this.mWidth = double.infinity,
        this.mHight = 50.0,
        this.mColor = AppColor.appBlackColor,
        this.mIcon,
        this.borderRadius = 21.00,
      });

  @override
  Widget build(BuildContext context) {
    var themeMode = Theme.of(context).brightness == Brightness.light;
    return SizedBox(
      width: mWidth,
      height: mHight,
      //yaha check lagayege ///
      child: ElevatedButton(
        onPressed: onpress,
        child: mIcon != null
            ? Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(mIcon),
            widthSpacer(),
            Text(title),
          ],
        )
            : Text(title,style: mHeadLine16(mColor: themeMode ? Colors.white : AppColor.appBlackColor),),
        style: ElevatedButton.styleFrom(
            backgroundColor: mColor ?? (themeMode ? AppColor.appBlackColor : Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),

            )
        ),



      ),
    );
  }
}
