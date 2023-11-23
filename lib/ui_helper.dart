import 'dart:ui';
import 'package:flutter/material.dart';

class AppColor {



  //light theme color//
  static const secondaryColor = Color(0xffdbd9dd);
  //static const bottomNavColor = Color(0xffdbdadb);//
  static const appBlackColor = Color(0xff14101c);//
  static const TextBlackColor = Color(0xff14101c);


  //dark theme color
  static const darkSecondaryColor = Color(0xffdbd9dd);
  // static const darkBottomNavColor = Color(0xffdbdadb);//
  static const darkAppBlackColor = Color(0xff14101c);
  static const darkTextBlackColor = Color(0xff14101c);

}



class AppTheme{
  static ThemeData darkTheme(){
    return ThemeData(
        scaffoldBackgroundColor: Colors.black87 ,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          displayLarge: mHeadLine43(mColor: Colors.white,mweight: FontWeight.bold),
          titleLarge: mHeadLine34(mColor: Colors.white,mweight: FontWeight.bold),
          titleMedium: mHeadLine16(mColor: Colors.white,mweight: FontWeight.bold),
          titleSmall: mHeadLine12(mColor: Colors.white,mweight: FontWeight.bold),
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue,
            iconTheme: IconThemeData(
              color: Colors.white,
            )
        )
    );
  }
  static ThemeData lightTheme(){
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        displayLarge: mHeadLine43(mColor: Colors.white,mweight: FontWeight.bold),
        titleLarge: mHeadLine34(mColor: Colors.white,mweight: FontWeight.bold),
        titleMedium: mHeadLine16(mColor: Colors.white,mweight: FontWeight.bold),
        titleSmall: mHeadLine12(mColor: Colors.white,mweight: FontWeight.bold),
      ),
      scaffoldBackgroundColor: Colors.blue,
      primaryColor: Colors.blue,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey,
          iconTheme: IconThemeData(
            color: Colors.white ,
          )
      ),

    );
  }
}

Widget widthSpacer({ double mwidth = 11.0 ,}){

  return SizedBox(
    width: mwidth,
  );
}

Widget hightSpacer({ double mhight = 11.0,}){

  return SizedBox(
    width: mhight,
  );
}


InputDecoration feildDecoration({
  required String hint,
  required String labelText,
  Color filledColor = AppColor.secondaryColor,
  IconData? prefixIcon,
  IconData? suffixIcon,
  bool ispasswordField = false,
}){
  return InputDecoration(
      filled: true,
      fillColor: filledColor,
      hintText:hint,
      label: Text(labelText),
      prefixIcon: prefixIcon!=null ? Icon(prefixIcon) :null,
      suffixIcon: suffixIcon!=null ? Icon(suffixIcon): null,

      enabledBorder: getBorder(),
      focusedBorder:getBorder(borderColor: Colors.white,
          borderWidth: 2
      )
  );

}



OutlineInputBorder getBorder({double radius=21,
  Color borderColor=AppColor.appBlackColor,
  double borderWidth = 1
}){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: borderColor,  width: borderWidth),


  );
}



TextStyle mHeadLine43({
  Color mColor = AppColor.TextBlackColor,
  FontWeight mweight = FontWeight.normal,
}) {
  return TextStyle(
    color: mColor,
    fontSize: 43,
    fontWeight: mweight,
  );
}

TextStyle mHeadLine34({
  Color mColor = AppColor.TextBlackColor,
  FontWeight mweight = FontWeight.normal,
}) {
  return TextStyle(
    color: mColor,
    fontSize: 34,
    fontWeight: mweight,
  );
}


TextStyle mHeadLine25({
  Color mColor = AppColor.TextBlackColor,
  FontWeight mweight = FontWeight.normal,
}) {
  return TextStyle(
    color: mColor,
    fontSize: 25,
    fontWeight: mweight,
  );
}

TextStyle mHeadLine21({
  Color mColor = AppColor.TextBlackColor,
  FontWeight mweight = FontWeight.normal,
}) {
  return TextStyle(
    color: mColor,
    fontSize: 21,
    fontWeight: mweight,
  );
}

TextStyle mHeadLine18({
  Color mColor = AppColor.TextBlackColor,
  FontWeight mweight = FontWeight.normal,
}) {
  return TextStyle(
    color: mColor,
    fontSize: 18,
    fontWeight: mweight,
  );
}

TextStyle mHeadLine16({
  Color mColor = AppColor.TextBlackColor,
  FontWeight mweight = FontWeight.normal,
}) {
  return TextStyle(
    color: mColor,
    fontSize: 16,
    fontWeight: mweight,
  );
}

TextStyle mHeadLine12({
  Color mColor = AppColor.TextBlackColor,
  FontWeight mweight = FontWeight.normal,
}) {
  return TextStyle(
    color: mColor,
    fontSize: 12,
    fontWeight: mweight,
  );
}
