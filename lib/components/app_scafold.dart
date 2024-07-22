import 'package:flutter/material.dart';

class AppScafold extends StatelessWidget {
  final Widget child;
  const AppScafold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
    );
  }
}
