import 'package:flutter/material.dart';

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20); // titik kiri bawah
    path.lineTo(size.width, size.height - 60); // titik kanan bawah
    path.lineTo(size.width, 0.0); // titik kanan atas
    path.close(); //tutup path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
