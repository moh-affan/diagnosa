import 'dart:ui';

import 'package:diagnosa/models.dart';
import 'package:diagnosa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class DetailPenyakitPage extends StatelessWidget {
  DetailPenyakitPage({Key key, @required this.penyakit, @required this.gejala})
      : super(key: key);

  final Penyakit penyakit;
  final String gejala;
  static final String tag = "/detail_penyakit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Detail Penyakit'),
        centerTitle: true,
        backgroundColorEnd: BlueRaspberry.end,
        backgroundColorStart: BlueRaspberry.start,
      ),
      body: Card(
        elevation: 1.0,
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Text(penyakit.penyakit,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0)),
              ),
              SizedBox(
                width: 20.0,
                height: 20.0,
              ),
              Image.asset(
                'images/${penyakit.id.toLowerCase()}.jpg',
                width: 150.0,
                height: 150.0,
              ),
              SizedBox(
                width: 20.0,
                height: 20.0,
              ),
              Text(
                "Gejala-Gejala",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color: Colors.black),
              ),
              SizedBox(
                width: 5.0,
                height: 5.0,
              ),
              Text(
                this.gejala,
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                width: 5.0,
                height: 5.0,
              ),
              Text(
                "Deskripsi",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color: Colors.black),
              ),
              SizedBox(
                width: 5.0,
                height: 5.0,
              ),
              Text(
                penyakit.deskripsi,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
