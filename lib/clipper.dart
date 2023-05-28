import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.3071375, size.height * 0.3273600);
    path_1.cubicTo(
        size.width * 0.3067750,
        size.height * 0.1999400,
        size.width * 0.3815000,
        size.height * 0.1964000,
        size.width * 0.4125000,
        size.height * 0.2000000);
    path_1.cubicTo(
        size.width * 0.4514375,
        size.height * 0.3614200,
        size.width * 0.5514000,
        size.height * 0.3594200,
        size.width * 0.5875000,
        size.height * 0.2000000);
    path_1.quadraticBezierTo(size.width * 0.6656000, size.height * 0.1954200,
        size.width * 0.6943500, size.height * 0.3273600);
    path_1.quadraticBezierTo(size.width * 0.6943500, size.height * 0.6060200,
        size.width * 0.6943500, size.height * 0.6990200);
    path_1.quadraticBezierTo(size.width * 0.6943500, size.height * 0.8229400,
        size.width * 0.6169000, size.height * 0.8229400);
    path_1.quadraticBezierTo(size.width * 0.4427250, size.height * 0.8229400,
        size.width * 0.3846250, size.height * 0.8229400);
    path_1.quadraticBezierTo(size.width * 0.3049125, size.height * 0.8229600,
        size.width * 0.3071375, size.height * 0.6990200);
    path_1.quadraticBezierTo(size.width * 0.3071375, size.height * 0.6060200,
        size.width * 0.3071375, size.height * 0.3273600);
    path_1.close();

    canvas.drawPath(path_1, paint_1);

    Paint paint_2 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5000002, size.height * 0.0804608);
    path_2.cubicTo(
        size.width * 0.5273750,
        size.height * 0.0804200,
        size.width * 0.5684875,
        size.height * 0.1111200,
        size.width * 0.5684620,
        size.height * 0.1899997);
    path_2.cubicTo(
        size.width * 0.5684875,
        size.height * 0.2338200,
        size.width * 0.5479250,
        size.height * 0.2995600,
        size.width * 0.5000002,
        size.height * 0.2995385);
    path_2.cubicTo(
        size.width * 0.4726125,
        size.height * 0.2995600,
        size.width * 0.4315250,
        size.height * 0.2667000,
        size.width * 0.4315384,
        size.height * 0.1899997);
    path_2.cubicTo(
        size.width * 0.4315250,
        size.height * 0.1462000,
        size.width * 0.4520625,
        size.height * 0.0804200,
        size.width * 0.5000002,
        size.height * 0.0804608);
    path_2.close();

    canvas.drawPath(path_2, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
