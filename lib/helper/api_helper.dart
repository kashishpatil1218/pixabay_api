

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class ApiHelper
{
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();

 final String _api= "https://pixabay.com/api/?key=47278739-e93ded0cbb4c55ad7b3548bd4&orientation=horizontal";

 Future<Map> fethchApiData()
 async {
   Uri uri = Uri.parse(_api);
   Response  response = await http.get(uri);
   if(response.statusCode==200)
     {
        String data = response.body;
        Map json = jsonDecode(data);
        return json;
     }
   return{};
 }
}


