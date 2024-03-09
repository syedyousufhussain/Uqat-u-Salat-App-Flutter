import "package:flutter/material.dart";
import 'package:flutter_qiblah/flutter_qiblah.dart';

import 'compass_qibla.dart';

class QiblaDirection extends StatefulWidget {
  const QiblaDirection({super.key});

  @override
  State<QiblaDirection> createState() => _QiblaDirectionState();
}

class _QiblaDirectionState extends State<QiblaDirection> {
  final _deviceSupport=FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: _deviceSupport,builder: (_, AsyncSnapshot<bool?> snapshot){
        if (snapshot.connectionState==ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),

          );
        }
        if(snapshot.hasError){
          return Center(
            child: Text("Error:${snapshot.error.toString()}"),
          );
        }
        if(snapshot.data!){
          return QiblahCompass();
        }
        else {
          return Center(child: Text("Your Device is not supported"));
        }
      }),
    );
  }
}