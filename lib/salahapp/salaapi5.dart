// import 'dart:js';

import 'package:api_prac_3/salahapp/sala_list.dart';
import "package:flutter/material.dart";

import 'sala.dart';
import 'salaapi.dart';

class SalahApi extends StatefulWidget {
  const SalahApi({super.key});

  @override
  State<SalahApi> createState() => _SalahApiState();
}

class _SalahApiState extends State<SalahApi> {
  List<PrayTime>? _praytime;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getPrays();
  }

  Future<void> getPrays() async {
    _praytime = (await PrayApi.getPray()).cast<PrayTime>();
    setState(() {
      _isLoading = false;
    });
    // print(_recipes);
    print(_praytime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10,),
            Text("Salah Times"),
          ],
        ),
      ),
      body: 
      // RecipeCard(title: "My Recipe", cookTime: "30 min", rating: "4.3", thumbnailUrl: "https://img.freepik.com/free-photo/burger-hamburger-cheeseburger_505751-3697.jpg?w=740&t=st=1699770772~exp=1699771372~hmac=40f6522f806013f7e59d65b5ba9b54c2aa9e74c3be582148ed5693b2c5cddc46"),);
      
          SalaCard(day: "date", fajartime: "fajartime", zuhartime: "zuhartime", asartime: "asartime", maghribtime: "maghribtime", ishatime: "ishatime"));
          // _isLoading?
          // Center(child: CircularProgressIndicator())
          // : ListView.builder(
          //   itemCount: _praytime?.length,
          //   itemBuilder: (context, index) {
          //   return SalaCard(
          //     fajartime: _praytime![index].Fajr,
          //     zuhartime: _praytime![index].Dhuhr,
          //     asartime: _praytime![index].Asr,
          //     maghribtime: _praytime![index].Maghrib,
          //     ishatime: _praytime![index].Isha, 
          //     day: _praytime![index].Date_for,);
          // },
        // )
      // );
    }
  }