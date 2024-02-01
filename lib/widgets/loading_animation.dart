// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomLoadingSpinner extends StatefulWidget {
  const CustomLoadingSpinner({super.key});

  @override
  _CustomLoadingSpinnerState createState() => _CustomLoadingSpinnerState();
}

class _CustomLoadingSpinnerState extends State<CustomLoadingSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Container(
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade700,
            ),
            child: const Center(
              child: Icon(
                Icons.autorenew,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
