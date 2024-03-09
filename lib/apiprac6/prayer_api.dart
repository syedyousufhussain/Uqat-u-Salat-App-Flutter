import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:intl/date_time_patterns.dart";
import 'package:intl/intl.dart';

DateTime currentDate=DateTime.now();
String formatdate=DateFormat('yyyy-MM-dd').format(currentDate);

class PrayerApi {
  Future<Map<String, dynamic>> getPrayerTimes(String city, String country) async {
    final response = await http.get(Uri.parse('https://api.aladhan.com/v1/timingsByCity/$formatdate?city=Karachi&country=Pakistan&method=1'),
      
      headers: {'Content-Type': 'application/json'},
      // Add your API parameters here.
      // Example: '?city=$city&country=$country&method=2'
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}