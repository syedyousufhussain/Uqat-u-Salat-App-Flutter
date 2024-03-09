import 'dart:convert';
import 'package:api_prac_3/apiprac6/SplashScreen.dart';
import 'package:api_prac_3/salahapp/salaapi5.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'apiprac4.dart';
import 'apiprac6/api_prac6.dart';
import 'postModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

// class ApiPrac3 extends StatefulWidget {
//   const ApiPrac3({Key? key});

//   @override
//   State<ApiPrac3> createState() => _ApiPrac3State();
// }

// class _ApiPrac3State extends State<ApiPrac3> {
//   List<Data> postlist = [];
//   Data ?namazTime;

//   static String city = 'Karachi';
//   static String country = 'Pakistan';
//   static int method = 1;

//   final String url =
//       'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method';

//   Future<void> getPTData() async {
//     http.Response res = await http.get(Uri.parse(url));
//     final data = jsonDecode(res.body);
//     // print(data);
//     // print(namazTime?.data.timings.fajr);
//     // for(var items in data){
//       data.forEach(key,value){print('$key==$value');
//     };
//   }
  
  
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getPTData();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           // You can use the postlist here to display the data in your UI
//           // Example: Text(postlist.isNotEmpty ? postlist[0].yourProperty : ''),
//         ),
//       ),
//     );
//   }
// }
