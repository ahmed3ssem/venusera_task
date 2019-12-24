import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:venusera_task/style.dart';

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  List<Asset> images = List<Asset>();
  DateTime _dateTime;
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
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  child: new Directionality(
                    textDirection: TextDirection.ltr,
                    child: new TextFormField(
                      //controller: DescriptionController,
                      decoration: const InputDecoration(
                        hintText: 'Request Name',
                        labelText: 'Request Name',
                      ),
                    ),
                  )),

            ],
          ),

          new Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: new Directionality(
                textDirection: TextDirection.ltr,
                child: new TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  //controller: DescriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Request Description',
                    labelText: 'Request Description',
                  ),
                ),
              )),
          new Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: new BoxDecoration(
              color: Colors.blue[200],
              borderRadius:
              BorderRadius.all(Radius.circular(20.0)),
            ),
            child:Column(
            children: <Widget>[
              Text(
                _dateTime == null
                    ? "nothing picked yet please select date"
                    : _dateTime.toString(),
                style: Styles.defualtText,
              ),
              ButtonTheme(
                //elevation: 4,
                //color: Colors.green,
                minWidth: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2222))
                        .then((date) {
                      setState(() {
                        _dateTime = date;
                      });
                    });
                  },
                  child: const Icon(Icons.date_range),
                  textColor: Colors.white,
                  color: Colors.blue,
                  height: 40,
                  minWidth: 40,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                ),
              ),
            ],
          )),
          ButtonTheme(
            //elevation: 4,
            //color: Colors.green,
            minWidth: double.infinity,
            child: MaterialButton(
              minWidth: 40,
              onPressed: loadAssets,
              textColor: Colors.white,
              color: Colors.blue,
              height: 40,
              child: const Icon(Icons.add_a_photo),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
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
              minWidth: 150,
              height: 40,
              child: Text("Add Request",style: Styles.textSizeLargeWhite,),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            ),
          ),
        ],
      ),
    );
  }
}
