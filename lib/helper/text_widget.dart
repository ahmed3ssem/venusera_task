import 'package:flutter/cupertino.dart';

class TextWidget {
    Future<Widget> _textWidget(String text) async {
      return Container(
        child: Text(text,
         textAlign: TextAlign.right
        )
      );
  }
  static Widget textWidgetStyle(String text,TextStyle style) {
      return Container(
        child: Text(text,
         textAlign: TextAlign.right,
         style: style,
        )
      );
  }
  static Widget textWidgetPadding(String text,double l,double t,double r,double b)  {
      return Container(
        padding: EdgeInsets.fromLTRB(l, t,r, b),
        child: Text(text,
         textAlign: TextAlign.right,
        )
      );
  }
  static Widget textWidgetStylePadding(String text,TextStyle style,double l,double t,double r,double b)  {
      return Container(
        padding: EdgeInsets.fromLTRB(l, t,r, b),
        child: Text(text,
         style: style,
        )
      );
  }
}