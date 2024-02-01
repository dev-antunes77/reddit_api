import 'package:flutter/material.dart';

class ThinVerticalDivider extends StatelessWidget {
  const ThinVerticalDivider({
    Key? key,
    this.horizontalPadding,
  }) : super(key: key);

  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 8),
      child: Container(height: 16, width: 1, color: Colors.white30),
    );
  }
}
