import 'package:flutter/material.dart';

class CustomNavigationBar extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue..style = PaintingStyle.fill;
    Path path = Path()..moveTo(30, 50);
    path.arcToPoint(const Offset(30,0),radius: const Radius.circular(10));
    path.quadraticBezierTo(30, 0, 50, 0);
    path.quadraticBezierTo(60, 0, 70, 10);
    path.arcToPoint(const Offset(110, 10),radius: const Radius.circular(30.0),clockwise: false);
    path.quadraticBezierTo(120, 0, 130, 0);
    path.quadraticBezierTo(130, 0, 150, 0);
    path.arcToPoint(const Offset(150, 50),radius: const Radius.circular(10));
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
