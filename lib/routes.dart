import 'package:diagnosa/moduls/beranda/beranda.dart';
import 'package:diagnosa/moduls/splash/splash.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  SplashPage.tag: (BuildContext context) => SplashPage(),
  BerandaPage.tag: (BuildContext context) => BerandaPage(title: 'Beranda'),
};
