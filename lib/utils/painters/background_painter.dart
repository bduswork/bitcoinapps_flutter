import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  final Color backgroundPaintColor = const Color(0xFF0F031D);
  final Color blurredCircleColor = const Color.fromARGB(255, 54, 12, 71);

  @override
  void paint(Canvas canvas, Size size) {
    // Background color
    //Paint backgroundPaint = Paint()..color = const Color(0xFF0F031D);
    Paint backgroundPaint = Paint()..color = backgroundPaintColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Blurred rectangle
    Rect rect = Offset.zero & size;
    Paint blurPaint = Paint()
      ..color = Colors.transparent
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(20));
    canvas.drawRect(rect, blurPaint);

    // Blurred circles
    Paint circlePaint = Paint()
      //..color = const Color.fromARGB(255, 54, 12, 71)
      ..color = blurredCircleColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(200));

    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.2), 70, circlePaint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.35), 75, circlePaint);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.8), 70, circlePaint);
  }

  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}