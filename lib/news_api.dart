import 'dart:convert';

import 'package:http/http.dart';

///## NewsApi
///
///### info:
///this class is responsable of requsting data from the api
///
///### features:
/// - get news with ability to specific what kind of news the user want by writing a `search keyword`
/// - get top news
class NewsApi {
  /// for the server domain
  String _server = "https://newsapi.org/";
  /// for the api key
  String _apiKey = "apiKey=bd0b762c40be433aab4545077498ab90";

  Future<Map> getNewsOf(String searchKeyWord) async {
    var url = Uri.parse("${_server}v2/everything?q=$searchKeyWord&$_apiKey");
    var response = await get(url);
    var data = jsonDecode(response.body);
    return data;
  }

  Future<Map> getTopNews() async {
    var url = Uri.parse("$_server/v2/top-headlines?$_apiKey");
    var response = await get(url);
    var data = jsonDecode(response.body);
    return data;
  }
}
