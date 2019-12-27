import 'dart:convert';

import 'package:http/http.dart';
import 'package:venusera_task/login.dart';
import 'package:venusera_task/model/request_item.dart';
import 'package:venusera_task/model/request_list_item.dart';

class RequestAPIProvider {
  Client client = Client();
  Future<RequestItemModel> fetchRequestList() async {
    print('fetch requests');
    final responseForRequestList = await client.get('http://myousif-001-site1.dtempurl.com/api/requests',
        headers: {"Accept": "application/json","Authorization": "Bearer "+UserLogin.Token});
    //print(responseForRequestList.body.toString());
    //print(responseForRequestList.statusCode);
    if (responseForRequestList.statusCode == 200) {
      return RequestItemModel.fromJson(json.decode(responseForRequestList.body));
    }
    else {
      throw Exception('Faield to load request');
    }
  }
  Future<OneRequestItemModel> fetchRequestByRequestId(int id) async{
    print('fetch one request by id');
    print("iddddddddddddddddddddddddddddddddddddddddd"+id.toString());
    final responseForRequest=await client.get('http://myousif-001-site1.dtempurl.com/api/requests/'+id.toString(),
        headers: {"Accept": "application/json","Authorization": "Bearer "+UserLogin.Token});
    print(responseForRequest.body.toString());
    print(responseForRequest.statusCode);
    if(responseForRequest.statusCode==200){
      var result = json.decode(responseForRequest.body);
      print(result);
      return OneRequestItemModel.fromJson(json.decode(responseForRequest.body));
    }
    else{
      throw Exception('Faield to load request');
    }
  }
}