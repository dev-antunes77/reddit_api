import 'package:flutter/material.dart';

Future<dynamic> callSimpleDisplayDialog(BuildContext context,
    {required Widget content, required List<Widget>? actions}) {
  return showDialog(
    context: context,
    builder: ((context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.white38, width: 1)),
          content: content,
          actions: actions,
        )),
  );
}
