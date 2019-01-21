import 'dart:ui';

import 'package:diagnosa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sweet_alert/flutter_sweet_alert.dart';

class DiagnosaPage extends StatefulWidget {
  DiagnosaPage({Key key, this.title}) : super(key: key);

  final String title;
  static final String tag = "/diagnosa";

  @override
  _DiagnosaPageState createState() => _DiagnosaPageState();
}

class _DiagnosaPageState extends State<DiagnosaPage>
    with SingleTickerProviderStateMixin {
  void _showDialog() {
    SweetAlert.dialog(
      type: AlertType.WARNING,
      cancelable: true,
      title: "Title",
      content: "Content",
      showCancel: true,
      cancelButtonText: "Cancel",
      confirmButtonText: "Confirm",
      closeOnConfirm: false,
      closeOnCancel: false,
    ).then((value) {
      print(value);
      if (value) {
        SweetAlert.update(
          type: AlertType.SUCCESS,
          cancelable: true,
          title: "done",
          content: "you pressed confirm",
          showCancel: false,
          closeOnConfirm: true,
          confirmButtonText: "Confirm",
        ).then((value) {
          print(value);
        });
      } else {
        SweetAlert.update(
          type: AlertType.SUCCESS,
          cancelable: true,
          title: "canceled",
          content: "you pressed cancel",
          showCancel: false,
          closeOnConfirm: true,
          confirmButtonText: "Confirm",
        ).then((value) {
          print(value);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _showDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Quepal.start,
          centerTitle: true,
          title: Text("Diagnosa"),
          toolbarOpacity: 0.9,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('images/diagnosa.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
        ));
  }
}
