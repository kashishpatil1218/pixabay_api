import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();

  Future<Map> fethchApiData() async {
    // for rendom data from pixabay
    String api =
        "https://pixabay.com/api/?key=47278739-e93ded0cbb4c55ad7b3548bd4&orientation=horizontal";
    Uri uri = Uri.parse(api);
    Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      Map json = jsonDecode(data);
      return json;
    }
    return {};
  }

//for search the data
  Future<Map> fetchApiDataBySearch(String search) async {
    Response response = await http.get(Uri.parse(
        '"https://pixabay.com/api/?key=47278739-e93ded0cbb4c55ad7b3548bd4&q=$search"'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    }
    return {};
  }
}
