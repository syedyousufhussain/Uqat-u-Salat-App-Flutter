import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Qibla.dart';
import 'prayer_api.dart';

class PrayerTimesScreen extends StatefulWidget {
  @override
  _PrayerTimesScreenState createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  final PrayerApi _prayerApi = PrayerApi();
  Map<String, dynamic>? _prayerTimesData = {};
  bool Status=false;
  bool ReStatus=true;
  



  @override
  void initState() {
    super.initState();
    _fetchPrayerTimes();
  }

  Future<void> _fetchPrayerTimes() async {
    try {
      final data = await _prayerApi.getPrayerTimes('city', 'country');
      setState(() {
        _prayerTimesData = data['data']['timings'];
        

      });
    } catch (e) {
      print('Error fetching prayer times: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أوقات الصلاة',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45),),
        centerTitle: true,
        backgroundColor: Colors.brown[900],
      ),
      body: Stack(
        children:[
          Image.asset("assets/download.jpg",fit:BoxFit.cover,width:double.infinity,height: double.infinity,), 
            // width: 280, height: 150),

            Container(
              // decoration: BoxDecoration(
              //   color: Colors.black
              //   // .withOpacity(0.1)
              // ),
              child: _prayerTimesData!.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView(
                    children:[
                      Container(
                        padding: EdgeInsets.all(18),
                        child: Row(
                          
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Day:$formatdate",style: TextStyle(fontWeight: FontWeight.w900,fontSize:27,color: Colors.white),),
                          ],
                        ),
                      ),
                      // SizedBox(height: 13,),
                      buildPrayerTimeItems('صلاة الفجر',_prayerTimesData!['Fajr']),
                      buildPrayerTimeItems("صلاة الظهر",_prayerTimesData!["Dhuhr"]),
                      buildPrayerTimeItems("صلاة العصر",_prayerTimesData!["Asr"]),
                      buildPrayerTimeItems("صلاة المغرب",_prayerTimesData!["Maghrib"]),
                      buildPrayerTimeItems("صلاة العشاء",_prayerTimesData!["Isha"]),
                      SizedBox(height: 45,),
                      Container(
                        // width: 80,
                        padding: EdgeInsets.only(left: 90,right: 90),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.brown[800]),
                            minimumSize: MaterialStateProperty.all(Size(160, 85)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(0)),
                              ),
                              
                            )
                          ),
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => QiblaDirection()));},
                        child: Text("Qibla Direction",style: TextStyle(fontWeight: FontWeight.w500,fontSize:22),),),
                      ),
                    ]
                    
                   ),
            ),
      
      ]),
            );
          }

Widget buildPrayerTimeItems(String title,String time ){
  return Container(
    padding: EdgeInsets.only(right: 93,left: 93),
    child: Card(
      color: Colors.brown[800]?.withOpacity(0.856),
      
      shape: RoundedRectangleBorder(
        
        borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft:Radius.circular(25) ),
        
        
      ),
      child: ListTile(
        title: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize:24),textAlign:TextAlign.center,),
        subtitle: Text(time,style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
      ),
    ),
  );
}}