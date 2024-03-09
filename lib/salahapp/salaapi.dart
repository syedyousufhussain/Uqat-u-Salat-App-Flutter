import 'dart:convert';
import 'package:api_prac_3/salahapp/sala.dart';
import 'package:http/http.dart' as http;

class PrayApi{

  static Future<List> getPray()async{
    var uri= Uri.http('muslimsalat.p.rapidapi.com','/Karachi',);

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "",
      "x-rapidapi-host": "",
      "useQueryString": "true"
       });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['items']) {
      _temp.add(i['items']);
    }
    return PrayTime.PrayFromSnapshot(_temp);
  }
}



  