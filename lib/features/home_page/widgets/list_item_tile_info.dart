import 'package:flutter/material.dart';

class ListItemTileInfo extends StatelessWidget {
  const ListItemTileInfo({
    super.key,
    required this.postInfo,
    this.icon,
    this.color,
  });

  final String postInfo;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          postInfo,
          style: TextStyle(fontSize: 12.0, color: color),
        ),
        const SizedBox(width: 4),
        if (icon != null) Icon(icon, color: color, size: 15),
      ],
    );
  }
}
