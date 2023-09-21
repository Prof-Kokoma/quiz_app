import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class CircularIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const CircularIcon({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: boxShadow,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}
