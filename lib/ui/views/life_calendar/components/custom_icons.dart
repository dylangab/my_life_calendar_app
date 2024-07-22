import 'package:flutter/material.dart';

class CustomsIcons extends StatelessWidget {
  final bool? islived;
  final Color? color;
  const CustomsIcons({super.key, required this.islived, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(size: 6.5, color: color, Icons.circle_rounded);
  }
}
