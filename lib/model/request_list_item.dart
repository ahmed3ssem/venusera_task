class RequestItemModel{
  String _status;
  String _message;
  List<_Request> _results=[];
  RequestItemModel.fromJson(Map<String,dynamic> parsedJson){
    print(parsedJson["result"].length);
    _status=parsedJson['status'];
    _message=parsedJson['message'];
    List<_Request> temp=[];
    for (int i = 0; i < parsedJson['result'].length; i++) {
      _Request result=_Request(parsedJson['result'][i]);
      temp.add(result);
    }
    _results=temp;
  }

  List<_Request> get results=>_results;
 String get status=>_status;
  String get message=>_message;
}
class _Request{
  int _id;
  String _name;
  String _date;
  String _description;
  int _clientID;
  _Request(result){
    _id=result['id'];
    _name=result['name'];
    _date=result['date'];
    _description=result['description'];
    _clientID=result['clientID'];
  }
  int get id=>_id;
  String get name=>_name;
  String get data=>_date;
  String get description=>_description;
  int get clientId=>_clientID;
}
class _Image{
  String _URL;
  _Image(result){
    _URL=result['image'];
  }
  String get url=>_URL;
}