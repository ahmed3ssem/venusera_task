import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Styles{
  static const _textSizeLarge=16.0;
  static const _textSizeHeaderSmall=16.0;
  static const _textSizeBig=14.0;
  static const _textSizeDefualt=14.0;
  static final Color defualtColor=Colors.white;
  static final Color _textColorStrong=_hexToColor('515C6F');
  static final Color _textColorDefualt=_hexToColor('888888');
  static final Color backgroundColorForInformationContainer=_hexToColor('1DD9DF');
  static final String _fontNameTitle='CairoBold';
  static final String _fontNameDefualt='CairoRegular';
    
    static final headerLarge=TextStyle(
      fontFamily: _fontNameTitle,
      fontSize:_textSizeLarge,
      color: _textColorStrong
    );
    
    static final defualtText=TextStyle(
      fontFamily: _fontNameDefualt,
      fontSize:_textSizeDefualt,
      color: _textColorDefualt
    );
    static final headerSmall=TextStyle(
      fontFamily: _fontNameDefualt,
      fontSize:_textSizeHeaderSmall,
      color: _textColorDefualt
    );
    static final textSizeLarge=TextStyle(
      fontFamily: _fontNameDefualt,
      fontSize:_textSizeBig,
      color: _textColorDefualt
    );
     static final textSizeLargeWhite=TextStyle(
      fontFamily: _fontNameTitle,
      fontSize:_textSizeHeaderSmall,
      color: Colors.white
    );
    static Color _hexToColor(String code) {
      return Color(
        int.parse(code.substring(0,6),radix:16)+0xff000000
      );
    }
}