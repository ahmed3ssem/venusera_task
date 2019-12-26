import 'dart:convert';

import 'package:http/http.dart';
import 'package:venusera_task/model/request_list_item.dart';

class RequestAPIProvider {
  Client client = Client();
  String Token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQiLCJyb2xlIjoiU2VydmljZVByb3ZpZGVyIiwibmJmIjoxNTc3Mzg2MzA4LCJleHAiOjE1Nzc5OTExMDgsImlhdCI6MTU3NzM4NjMwOH0.bFgbRp7GPIMnEOAOkSJfwVrN4Onzbxr4_7HT05uIlNE";
  Future<RequestItemModel> fetchRequestList() async {
    print('fetch requests');
    final response = await client.get('http://myousif-001-site1.dtempurl.com/api/requests',
        headers: {"Accept": "application/json","Authorization": "Bearer "+Token});
    print(response.body.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      return RequestItemModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Faield to load request');
    }
  }
}