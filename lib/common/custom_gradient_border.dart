import 'package:btcapp/enum/border_side_type.dart';
import 'package:flutter/material.dart';

class CustomGradientBorder extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final double? borderWidth;
  final Color? borderColor;
  final Set<BorderSideType> borderSideTypes;
  final BorderRadius? borderRadius;

  const CustomGradientBorder({super.key, 
    required this.child,
    this.gradient,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.borderSideTypes = const {
      BorderSideType.top,
      BorderSideType.bottom,
      BorderSideType.left,
      BorderSideType.right
    },
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border(
          top: borderSideTypes.contains(BorderSideType.top)
              ? BorderSide(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0)
              : BorderSide.none,
          bottom: borderSideTypes.contains(BorderSideType.bottom)
              ? BorderSide(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0)
              : BorderSide.none,
          left: borderSideTypes.contains(BorderSideType.left)
              ? BorderSide(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0)
              : BorderSide.none,
          right: borderSideTypes.contains(BorderSideType.right)
              ? BorderSide(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0)
              : BorderSide.none,
        ),
        gradient: gradient,
      ),
      child: child,
    );
  }
}