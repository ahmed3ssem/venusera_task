class OneRequestItemModel{
  String _status;
  String _message;
  _Request _result;
  OneRequestItemModel.fromJson(Map<String,dynamic> parsedJson){
    print(parsedJson["result"].length.toString()+"in one request ");
    _status=parsedJson['status'];
    _message=parsedJson['message'];
    _result=_Request(parsedJson['result']);
  }
  _Request get result=>_result;
  String get status=>_status;
  String get message=>_message;
}
class _Request{
  int _id;
  String _name;
  String _date;
  String _description;
  int _clientID;
  List<_Image> _images=new List<_Image>();
  List<_Comment> _commentList=new List<_Comment>();
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
        _images.add(image);
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
}
class _Image{
  String _URL;
  _Image(result){
    _URL=result['image'];
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