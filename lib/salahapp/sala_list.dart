import 'package:flutter/material.dart';

class SalaCard extends StatelessWidget {
  final String ?day;
  final String ?fajartime;
  final String ?zuhartime;
  final String ?asartime;
  final String ?maghribtime;
  final String ?ishatime;

  SalaCard({
    required this.day,
    required this.fajartime,
    required this.zuhartime,
    required this.asartime,
    required this.maghribtime,
    required this.ishatime,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(right:85),
      height: 180,
      // width: 160,
      color: Colors.blueGrey,
      margin: EdgeInsets.only(left: 120,right: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Text(day!,style: TextStyle(color: Colors.white),)),
          SizedBox(height: 6,),
          Text(fajartime!,style: TextStyle(color: Colors.white),),
          SizedBox(height:6),
          Text(zuhartime!,style: TextStyle(color: Colors.white),),
          SizedBox(height: 6,),
          Text(asartime!,style: TextStyle(color: Colors.white),),
          SizedBox(height: 6,),
          Text(maghribtime!,style: TextStyle(color: Colors.white),),
          SizedBox(height: 6,),
          Text(ishatime!,style: TextStyle(color: Colors.white),),
          SizedBox(height: 6,),
        ],
      ));
        
         
}}