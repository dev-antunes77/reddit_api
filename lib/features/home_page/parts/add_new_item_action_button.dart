import 'package:api_mock/features/creating_page/creating_page.dart';
import 'package:api_mock/widgets/page_animator.dart';
import 'package:flutter/material.dart';

class AddNewItemActionButton extends StatelessWidget {
  const AddNewItemActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.grey[800],
      elevation: 13,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: const Center(
          child: Icon(
        Icons.add,
        color: Colors.white,
      )),
      onPressed: () => Navigator.of(context).push(
        PageAnimator(
          child: const CreatingPage(),
        ),
      ),
    );
  }
}
