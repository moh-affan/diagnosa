import 'dart:ui';

import 'package:diagnosa/moduls/diagnosa/data_master.dart';
import 'package:diagnosa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class PenyakitPage extends StatefulWidget {
  PenyakitPage({Key key, this.title}) : super(key: key);

  final String title;
  static final String tag = "/penyakit";

  @override
  _PenyakitPageState createState() => _PenyakitPageState();
}

class _PenyakitPageState extends State<PenyakitPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text('Penyakit'),
          centerTitle: true,
          backgroundColorEnd: BlueRaspberry.end,
          backgroundColorStart: BlueRaspberry.start,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(1),
              controller: ScrollController(keepScrollOffset: false),
              childAspectRatio: 2.5,
              children: List.generate(penyakit.length, (index) {
                return InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: penyakit.values.toList()[index],
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.lightGreen,
                        textColor: Colors.white);
                  },
                  child: Card(
                    color: Colors.white,
                    clipBehavior: Clip.antiAlias,
                    elevation: 2.0,
                    child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Quepal.start, Quepal.end]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        child: Center(
                          child: Text(
                            penyakit.values.toList()[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                );
              })),
        ));
  }
}
