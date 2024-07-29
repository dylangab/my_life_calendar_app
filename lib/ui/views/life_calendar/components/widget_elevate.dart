import 'package:flutter/material.dart';

class WidgetElevate extends StatelessWidget {
  final Widget child;
  const WidgetElevate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8))),
      child: child,
    );
  }
}
