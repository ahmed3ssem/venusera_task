import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  List<Asset> images = List<Asset>();
  static TextEditingController RequestEditingContrller =
  TextEditingController();
  static TextEditingController RequestDateEditingContrller =
  TextEditingController();
  static TextEditingController RequestDescriptionEditingContrller =
  TextEditingController();

  static String Request = RequestEditingContrller.toString();
  static String RequestDate = RequestDateEditingContrller.toString();
  static String RequestDescription =
  RequestDescriptionEditingContrller.toString();

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }
  Future saveImage(Asset asset) async {
    ByteData byteData = await asset.requestOriginal();
    List<int> imageData = byteData.buffer.asUint8List();
    print(imageData);
  }
  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    try {
      resultList = await MultiImagePicker.pickImages(
          maxImages: 5,
          enableCamera: true,
          selectedAssets: images,
          cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
          materialOptions: MaterialOptions(
            actionBarColor: "#abcdef",
            actionBarTitle: "Example App",
            allViewTitle: "All Photos",
            selectCircleStrokeColor: "#000000",
          ));
    } on Exception catch (e) {}

    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Request"),
        centerTitle: true,
      ),
      body:Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          TextField(
            autofocus: false,
            obscureText: false,
            keyboardType: TextInputType.text,
            controller: RequestEditingContrller,
            decoration: InputDecoration(
                labelText: "Request",
                hintText: "Request",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                        width: 1,
                        color: Colors.green,
                        style: BorderStyle.solid))),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            autofocus: false,
            obscureText: false,
            keyboardType: TextInputType.text,
            controller: RequestDescriptionEditingContrller,
            decoration: InputDecoration(
                labelText: "Request Description",
                hintText: "Request Description",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                        width: 1,
                        color: Colors.green,
                        style: BorderStyle.solid))),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            autofocus: false,
            obscureText: false,
            keyboardType: TextInputType.datetime,
            controller: RequestDateEditingContrller,
            decoration: InputDecoration(
                labelText: "Request Date",
                hintText: "Request Date",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                        width: 1,
                        color: Colors.green,
                        style: BorderStyle.solid))),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonTheme(
            //elevation: 4,
            //color: Colors.green,
            minWidth: double.infinity,
            child: MaterialButton(
              onPressed: loadAssets,
              textColor: Colors.white,
              color: Colors.blue,
              height: 40,
              child: Text("Select Images"),
            ),
          ),
          //RaisedButton(
            //child: Text("Save Image"),
            //onPressed: () => saveImage,
          //),
          Expanded(
            child: buildGridView(),
          ),
          ButtonTheme(
            //elevation: 4,
            //color: Colors.green,
            minWidth: double.infinity,
            child: MaterialButton(
              onPressed: () => {},
              textColor: Colors.white,
              color: Colors.blue,
              height: 40,
              child: Text("Add Request"),
            ),
          ),
        ],
      ),
    );
  }
}