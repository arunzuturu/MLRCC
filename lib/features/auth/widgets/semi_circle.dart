import 'dart:math';

import 'package:flutter/material.dart';

class SemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 700
      ..style = PaintingStyle.stroke;

    final double radius  = 20;
    final Offset center = Offset(0, size.height - radius);

    final Rect rect = Rect.fromCircle(center: center, radius: radius);
    final double startAngle = -pi / 2;
    final double sweepAngle = pi;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SemiCircle extends StatelessWidget {
  const SemiCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SemiCirclePainter(),
      child: Container(),
    );
  }
}
