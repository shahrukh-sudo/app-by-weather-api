import 'package:http/http.dart'as http;
import 'dart:convert';
const apiKey = '7c2fe045e2b1115fdbf30c2215bc4a18';

class NetworkHelper{
  Uri uri;

  NetworkHelper(this.uri);
  Future getData()async{


    http.Response response = await http.get(uri);
    if(response.statusCode == 200){
      var sr  = jsonDecode(response.body);
      return sr;
    }
    else{
      print(response.statusCode);
    }


  }


}