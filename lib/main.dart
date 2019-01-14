import 'package:diagnosa/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static const String VERSION = '1.0.0';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diagnosa',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Montserrat'),
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
