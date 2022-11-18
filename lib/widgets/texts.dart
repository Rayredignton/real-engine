import 'package:flutter/material.dart';

Widget testText(String text, double fontSize, Color fontColor, int maxLine,
    {String fontFamily = "Inter",
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight}) {
  return Text(
    text,
    overflow: overflow,
  
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        
        fontWeight: fontWeight),
    maxLines: maxLine,
    softWrap: true,
    
    textAlign: textAlign,
    
  );
}