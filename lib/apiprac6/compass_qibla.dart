import 'dart:async';
import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

import 'location.dart';

class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController = StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  Future<void> _checkLocationStatus() async {
    // before running the app please enable your location

    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اتجاه القبلة",style:TextStyle(fontSize: 55,fontWeight: FontWeight.w900)),
        backgroundColor: Colors.brown[600],
        centerTitle: true,
      ),
      body: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/Qibla/14924449_rm194-aew-13.jpg",fit:BoxFit.cover,width:double.infinity,height: double.infinity,),
        Positioned.fill(
            child: Opacity(
              opacity: 0.567,
              child: Container(color: Colors.brown),
            ),
          ),

        StreamBuilder(
          stream: stream,
          builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.enabled == true) {
              switch (snapshot.data!.status) {
                case LocationPermission.always:
                case LocationPermission.whileInUse:
                  return QiblahCompassWidget();

                case LocationPermission.denied:
                  return LocationErrorWidget(
                    error: "Location service permission denied",
                    callback: _checkLocationStatus,
                  );
                case LocationPermission.deniedForever:
                  return LocationErrorWidget(
                    error: "Location service Denied Forever !",
                    callback: _checkLocationStatus,
                  );
                default:
                  return Container();
              }
            } else {
              return LocationErrorWidget(
                error: "Please enable Location service",
                callback: _checkLocationStatus,
              );
            }
          },
        ),
      ]));
  }

}

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset('assets/Qibla/compass.svg');
  final _needleSvg = SvgPicture.asset('assets/Qibla/needle.svg',
    fit: BoxFit.contain,
    height: 300,
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          {
            return const Center(child: CircularProgressIndicator(),);
          }

        final qiblahDirection = snapshot.data!;

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: (qiblahDirection.direction * (pi / 180) * -1),
              child: _compassSvg,
            ),
            Transform.rotate(
              angle: (qiblahDirection.qiblah * (pi / 180) * -1),
              alignment: Alignment.center,
              child: _needleSvg,
            ),
            Positioned(
              bottom: 8,
              child: Text("Directions:${qiblahDirection.offset.toStringAsFixed(3)}°",style:TextStyle(color: Colors.white,fontSize: 22,fontStyle: FontStyle.italic)),
            )
          ],
        );
      },
    );
  }
}