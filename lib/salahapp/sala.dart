class PrayTime{
  final String ?Date_for;
  final String ?Fajr;
  final String ?Dhuhr;
  final String ?Asr;
  final String ?Maghrib;
  final String ?Isha;

  PrayTime({this.Date_for,this.Fajr,this.Dhuhr,this.Asr,this.Maghrib,this.Isha});

  factory PrayTime.fromJson(dynamic json){
    return PrayTime(
      Date_for:json('date_for')as String,
      Fajr: json('fajr')as String,
      Dhuhr: json('dhuhr') as String,
      Asr: json('asr') as String,
      Maghrib: json('maghrib') as String,
      Isha: json('isha') as String
      );
    }
    static List PrayFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return PrayTime.fromJson(data);
    }).toList();
  }
  @override
  String toString(){
    return 'PrayTime{Date_for:$Date_for,Fajr:$Fajr,Dhuhar:$Dhuhr,Asr:$Asr}';
  }}

