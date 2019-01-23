import 'dart:async';
import 'dart:ui';

import 'package:diagnosa/moduls/diagnosa/data_master.dart';
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
  var _answerMap = {
    'P001': 0,
    'P002': 0,
    'P003': 0,
    'P004': 0,
    'P005': 0,
    'P006': 0,
    'P007': 0,
    'P008': 0,
    'P009': 0,
    'P010': 0,
    'P011': 0
  };
  var _currentQestion = 0;
  var _diagnozed = '';

  void _findDiagnozed(String k, int v) {
    if (v >= 4) _diagnozed = k;
  }

  void _askQuestion(String gejalaId, String question) async {
    SweetAlert.dialog(
      type: AlertType.NORMAL,
      cancelable: true,
      title: "Diagnosa Penyakit Anda",
      content: "Apakah $question ?",
      showCancel: true,
      cancelButtonText: "Tidak",
      confirmButtonText: "Ya",
      closeOnConfirm: false,
      closeOnCancel: false,
    ).then((value) {
      if (value) {
        //Jawaban Iya
        gejalaPenyakit[gejalaId]
            .forEach((penyakitId) => _answerMap[penyakitId] += 1);
      } else {
        //Jawaban Tidak
      }
      //tampilkan dialog selanjutnya atau munculkan hasil diagnosa
      _answerMap.forEach(_findDiagnozed);
      if (_diagnozed == '') {
        SweetAlert.close(closeWithAnimation: true);
        _askQuestion(gejala.keys.toList()[++_currentQestion],
            gejala.values.toList()[_currentQestion]);
      } else {
        SweetAlert.close(closeWithAnimation: true);
        final hasil = penyakit[_diagnozed];
        SweetAlert.dialog(
          type: AlertType.SUCCESS,
          cancelable: true,
          title: "Hasil Diagnosa",
          content:
              "Berdasarkan gejala-gejala yang telah Anda jawab, kami mendiagnosa bahwa Anda mengalami : $hasil",
          showCancel: false,
          closeOnConfirm: true,
          confirmButtonText: "Tutup",
        ).then((value) {
          Navigator.pop(context);
        });
      }
    });
  }

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
    Timer(Duration(seconds: 2),
        () => _askQuestion(gejala.keys.toList()[0], gejala.values.toList()[0]));
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
