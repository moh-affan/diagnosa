import 'dart:async';

import 'package:diagnosa/main.dart';
import 'package:diagnosa/moduls/beranda/beranda.dart';
import 'package:diagnosa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);
  static final String tag = "/";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<PermissionGroup> permissions = new List<PermissionGroup>();

  void _navigateNext() {
    Navigator.of(context).pushReplacementNamed(BerandaPage.tag);
  }

  _startTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, _navigateNext);
  }

  @override
  void initState() {
    super.initState();
    checkPermissions();
    _startTime();
  }

  checkPermissions() async {
    PermissionStatus permissionStatus =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    if (permissionStatus != PermissionStatus.granted)
      permissions.add(PermissionGroup.storage);
    await requestPermission();
  }

  requestPermission() async {
    await PermissionHandler().requestPermissions(permissions);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CircularProgressIndicator(
                  strokeWidth: 2.0,
                  backgroundColor: Quepal.end,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Versi ' + App.VERSION,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                )
              ],
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10.0),
              child: Image.asset(
                'images/stetoskop.png',
                width: 150.0,
                height: 150.0,
              ),
            ),
            Text(
              'DIAGNOSA',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(offset: Offset(1.0, 1.0), blurRadius: 5.0)],
                  foreground: Paint()
                    ..shader = createLinearGradientShader(
                        [JShine.start, JShine.middle, JShine.end])),
            ),
          ],
        )
      ],
    ));
  }
}
