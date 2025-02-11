import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Gradient gradient;
  final Color borderColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 141,
    this.height = 40,
    this.gradient = const LinearGradient(
      colors: [
        Color(0xFF74A3E8), // Start color
        Color(0xFF262D49), // Softer dark blue instead of black
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    this.borderColor = const Color(0xFF74A3E8),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: borderColor,
            width: 1.3,
          ),
          gradient: gradient,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
