import 'package:diagnosa/moduls/beranda/beranda.dart';
import 'package:diagnosa/moduls/diagnosa/diagnosa.dart';
import 'package:diagnosa/moduls/penyakit/penyakit.dart';
import 'package:diagnosa/moduls/splash/splash.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  SplashPage.tag: (BuildContext context) => SplashPage(),
  BerandaPage.tag: (BuildContext context) => BerandaPage(title: 'Beranda'),
  DiagnosaPage.tag: (BuildContext context) => DiagnosaPage(title: 'Diagnosa'),
  PenyakitPage.tag: (BuildContext context) => PenyakitPage(title: 'Penyakit'),
};
