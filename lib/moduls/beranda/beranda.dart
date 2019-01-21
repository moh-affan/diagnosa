import 'package:diagnosa/moduls/diagnosa/diagnosa.dart';
import 'package:diagnosa/utils/colors.dart';
import 'package:diagnosa/widget/clipper/diagonal_clipper.dart';
import 'package:diagnosa/widget/clipper/diagonal_clipper_bottom.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BerandaPage extends StatefulWidget {
  BerandaPage({Key key, this.title}) : super(key: key);

  final String title;
  static final String tag = "/beranda";

  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage>
    with SingleTickerProviderStateMixin {
  static BuildContext ctx;

  Widget _header = ClipPath(
    clipper: DiagonalClipper(),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Container(
        color: Quepal.start,
        child: SizedBox(
            width: double.infinity,
            height: 200.0,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/diagnosa.jpg',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/stetoskop.png',
                        width: 70.0,
                        height: 70.0,
                        alignment: Alignment.center,
                        colorBlendMode: BlendMode.darken,
                        filterQuality: FilterQuality.high,
                      ),
                      Text(
                        'DIAGNOSA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(offset: Offset(1.0, 1.0), blurRadius: 5.0)
                            ]),
                        textScaleFactor: 2.0,
                      )
                    ],
                  ),
                )
              ],
            ))),
  );

  Widget _footer = ClipPath(
    clipper: DiagonalBottomClipper(),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Container(
        color: Quepal.start,
        child: SizedBox(
            width: double.infinity,
            height: 150.0,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/diagnosa.jpg',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ],
            ))),
  );

  Widget _body = Padding(
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            // Fluttertoast.showToast(
            //     msg: "Diagnosa",
            //     toastLength: Toast.LENGTH_SHORT,
            //     timeInSecForIos: 1,
            //     backgroundColor: Colors.lightGreen,
            //     textColor: Colors.white);
            // _showDialog();
            _navigate();
          },
          child: Card(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            elevation: 2.0,
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: Container(
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Quepal.start, Quepal.end]),
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  child: Row(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(
                            'images/menu_diagnosa.png',
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Diagnosa',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: () {
            Fluttertoast.showToast(
                msg: "Penyakit",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIos: 1,
                backgroundColor: Colors.lightGreen,
                textColor: Colors.white);
          },
          child: Card(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            elevation: 2.0,
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [JShine.start, JShine.middle, JShine.end]),
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  child: Row(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(
                            'images/menu_penyakit.png',
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Penyakit',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
            ),
          ),
        )
      ],
    ),
  );

  static void _navigate() {
    Navigator.of(ctx).pushNamed(DiagnosaPage.tag);
  }

  @override
  void initState() {
    super.initState();
    ctx = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(
          // alignment: Alignment.center,
          children: <Widget>[
            _header,
            SizedBox(
              height: 10.0,
              width: double.infinity,
            ),
            _body
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _footer,
        )
      ],
    ));
  }
}
