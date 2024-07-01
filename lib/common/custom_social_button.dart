import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String imageUrl;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CustomSocialButton(
      {super.key,
      required this.imageUrl,
      required this.onPressed,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: 45,
          width: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(width: 0.75, color: Colors.cyanAccent)),
          child: Image.asset(imageUrl, height: 24)),
    );
  }
}
