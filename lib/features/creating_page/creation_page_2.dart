// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/core/theme/text_styles_data.dart';
import 'package:api_mock/features/creating_page/widgets/creation_form.dart';

class CreatingPage2 extends StatefulWidget {
  const CreatingPage2({
    Key? key,
    this.item,
    this.isEdidtion = false,
  }) : super(key: key);

  final PostItem? item;
  final bool isEdidtion;

  @override
  State<CreatingPage2> createState() => _CreatingPageState();
}

class _CreatingPageState extends State<CreatingPage2> {
  TextEditingController authorCtrl = TextEditingController();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController commentNumCtrl = TextEditingController();
  TextEditingController upsNumCtrl = TextEditingController();

  @override
  void initState() {
    if (widget.item != null) {
      authorCtrl.text = widget.item!.author;
      titleCtrl.text = widget.item!.title;
      commentNumCtrl.text = widget.item!.commentsQuantity.toString();
      upsNumCtrl.text = widget.item!.ups.toString();
    }

    super.initState();
  }

  bool isKeyboardActive = false;

  bool get readyToAdd =>
      authorCtrl.text.length > 2 && titleCtrl.text.length > 2;

  @override
  Widget build(BuildContext context) {
    bool isKeyboardActive = MediaQuery.of(context).viewInsets.bottom > 0;
    final spacer = SizedBox(
        height:
            isKeyboardActive ? 6 : MediaQuery.of(context).size.height * 0.12);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.isEdidtion ? 'Editing' : 'Add to your play list',
          style: TextStyleData.title,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              spacer,
              CreationForm(
                label: 'Author',
                textCtrl: authorCtrl,
                onChanged: (value) => setState(() => authorCtrl.text = value),
              ),
              const SizedBox(height: 20),
              CreationForm(
                label: 'Title',
                textCtrl: titleCtrl,
                onChanged: (value) => setState(() => titleCtrl.text = value),
              ),
              const SizedBox(height: 20),
              CreationForm(
                label: 'Number of comments',
                textCtrl: commentNumCtrl,
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    setState(() => commentNumCtrl.text = value),
              ),
              const SizedBox(height: 20),
              CreationForm(
                label: 'Number of ups',
                keyboardType: TextInputType.number,
                textCtrl: upsNumCtrl,
                onChanged: (value) => setState(() => upsNumCtrl.text = value),
              ),
              spacer,
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(readyToAdd
                        ? Colors.grey[800]
                        : // Color when pressed
                        Colors.grey.shade700),
                  ),
                  onPressed: readyToAdd ? () {} : null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      widget.isEdidtion ? Icons.edit : Icons.add,
                      size: widget.isEdidtion ? 20 : 40,
                      color: readyToAdd ? Colors.white : Colors.grey.shade400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
