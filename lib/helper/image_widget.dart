import 'package:flutter/cupertino.dart';

class ImageWidget {
   static Widget imageWidget(String url) {
    var assetsImage = new AssetImage(url);
    var image = new Image(image: assetsImage,fit: BoxFit.fitWidth);
    return Container(
      child:image,
    );
  }
   static Widget imageWidgetPadding(String url,double l,double t,double r,double b) {
    var assetsImage = new AssetImage(url);
    var image = new Image(image: assetsImage,fit: BoxFit.fitWidth);
    return Container(
      padding: EdgeInsets.fromLTRB(l, t,r, b),
      child:image,
    );
  }
 Widget _imageWidgetWidth(String url,double width) {
    var assetsImage = new AssetImage(url);
    var image = new Image(image: assetsImage,fit: BoxFit.fitWidth);
    return Container(
      constraints:BoxConstraints.tightFor(width: width),
      child:image,
    );
  }
  static Widget networkImageWidget(String url,double width,double height){
    return Container(
      width: width,
      height: height,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
          image: new DecorationImage(
          fit: BoxFit.fill,
          image: new NetworkImage(
                 url)
                 )));
  }
  static Widget networkImageCircleWidget(String url,double width,double height){
    return Container(
      width: width,
      height: height,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
          fit: BoxFit.fill,
          image: new NetworkImage(
                 url)
                 )));
  }
}