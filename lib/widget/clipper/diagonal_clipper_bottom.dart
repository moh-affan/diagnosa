import 'package:flutter/material.dart';

class DiagonalBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.moveTo(0.0, size.height - 80); // titik kiri atas
    path.lineTo(size.width, 0.0); // titik kanan atas
    path.lineTo(size.width, size.height); // titik kanan bawah
    path.lineTo(0.0, size.height); // titik kiri bawah
    path.close(); //tutup path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
