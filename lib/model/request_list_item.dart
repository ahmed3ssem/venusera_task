class RequestItemModel{
  String _status;
  String _message;
  List<_Request> _results=[];
  List<_Image> _images=[];
  List<String> listOfUrls=[];
  RequestItemModel.fromJson(Map<String,dynamic> parsedJson){
    print(parsedJson["result"].length.toString()+"in request list");
    _status=parsedJson['status'];
    _message=parsedJson['message'];
    List<_Request> temp=[];
    List<_Image> temp2=[];
    for (int i = 0; i < parsedJson['result'].length; i++) {
      _Request result=_Request(parsedJson['result'][i]);
      if(parsedJson['result'][i]['images'].length!=null){
        //print(parsedJson['result'][i]['images'].length.toString()+"in request item modek");
        for (int j= 0; j< parsedJson['result'][i]['images'].length; j++){
          _Image image=_Image(parsedJson['result'][i]['images'][j]);
          temp2.add(image);
        }
      }
      temp.add(result);
    }
    _results=temp;
    _images=temp2;
  }
  List<_Request> get results=>_results;
  String get status=>_status;
  String get message=>_message;
  List<_Image> get imageList=>_images;
}
class _Request{
  int _id;
  String _name;
  String _date;
  String _description;
  int _clientID;
  List<_Comment> _commentList=new List<_Comment>();
  List<_Image> _images=new List<_Image>();
  String _imageURL;
  _Request(result){
    _id=result['id'];
    _name=result['name'];
    _date=result['date'];
    _description=result['description'];
    _clientID=result['clientID'];
    if(result['comments'].length!=null) {
      for (int i = 0; i < result['comments'].length; i++) {
        _Comment comment = _Comment(result['comments'][i]);
        _commentList.add(comment);
      }
    }
    if(result['images'].length!=null) {
      for (int i = 0; i < result['images'].length; i++) {
        _Image image = _Image(result['images'][i]);
        _imageURL=image._URL;
        _images.add(image);
      }
      if(_imageURL==null||_imageURL==""){
        _imageURL="https://cdn.dribbble.com/users/1963449/screenshots/5915645/404_not_found.png";
      }
    }
  }
  int get id=>_id;
  String get name=>_name;
  String get data=>_date;
  String get description=>_description;
  int get clientId=>_clientID;
  List<_Comment> get commentList=>_commentList;
  List<_Image> get images=>_images;
  String get imageURL=>_imageURL;
}
class _Image{
  String _URL;
  _Image(result){
    _URL=result['image'];
    var spliting =_URL.split("~");
    print(spliting.length);
    if(spliting.length>=2) {
      final replace=spliting[1].replaceAll("\\", "/");
      _URL = "http://myousif-001-site1.dtempurl.com"+replace;

    }
    else{
      _URL="https://cdn.dribbble.com/users/1963449/screenshots/5915645/404_not_found.png";
    }
  }

  String get url=>_URL;
}
class _Comment{
  int _id;
  int _serviceProviderID;
  String _comment;
  String _serviceProviderName;
  _Comment(result){
    _id=result['id'];
    _comment=result['comment'];
    _serviceProviderID=result['serviceProviderID'];
    _serviceProviderName=result['serviceProviderName'];
  }
  int get id=>_id;
  int get serviceProviderID=>_serviceProviderID;
  String get comment=>_comment;
  String get serviceProviderName=>_serviceProviderName;
}