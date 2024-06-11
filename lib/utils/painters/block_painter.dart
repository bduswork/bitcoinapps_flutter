import 'package:flutter/material.dart';


class BlockPainter extends CustomPainter {
  final LinearGradient linearGradient;
  final Color bgColor;
  final double borderStrokeWidth;
  final bool isEmptyAndLightModeBlock;

  BlockPainter({
    required this.linearGradient, 
    required this.bgColor,
    required this.borderStrokeWidth,
    required this.isEmptyAndLightModeBlock
  });

  final double containerRadius = 20.0;  // Radius for the rounded edges
  final double smoothRadius = 5.0;      // Radius for the cut rounded edges
  

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    final path = Path();

    // Move to top left corner with rounded corner
    path.moveTo(containerRadius, 0);

    // Line to top right corner before the first smooth curve
    path.lineTo(size.width - containerRadius - smoothRadius*2, 0);

    // First smooth curve before the 45-degree cut
    path.quadraticBezierTo(
      size.width - containerRadius - smoothRadius, 0,
      size.width - containerRadius, smoothRadius,
    );

    // 45-degree cut
    path.lineTo(size.width - smoothRadius, containerRadius + 0);

    // Second smooth curve after the 45-degree cut
    path.quadraticBezierTo(
      size.width, containerRadius + smoothRadius,
      size.width, containerRadius + 2 * smoothRadius,
    );

    // Line to bottom right corner with rounded corner
    path.lineTo(size.width, size.height - containerRadius);
    path.quadraticBezierTo(size.width, size.height, size.width - containerRadius, size.height);

    // Line to bottom left corner with rounded corner
    path.lineTo(containerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - containerRadius);

    // Line to top left corner with rounded corner
    path.lineTo(0, containerRadius);
    path.quadraticBezierTo(0, 0, containerRadius, 0);

    // Line back to starting point
    path.close();

    // Draw the background path
    canvas.drawPath(path, paint);

    // Create a border paint with gradient
    final borderPaint = Paint()
      ..shader = linearGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderStrokeWidth;

    // Draw the border path
    isEmptyAndLightModeBlock? null : canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}