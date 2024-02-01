// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ThinListSeparator extends StatelessWidget {
  const ThinListSeparator({
    Key? key,
    this.paddingTop,
  }) : super(key: key);
  final double? paddingTop;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 0.3,
        width: double.infinity,
        color: Colors.grey.shade300,
        margin: EdgeInsets.only(bottom: 8, top: paddingTop ?? 0));
  }
}
