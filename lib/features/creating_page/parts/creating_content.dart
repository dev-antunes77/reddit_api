// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_mock/core/theme/app_colors.dart';
import 'package:api_mock/features/creating_page/cubit/creating_cubit.dart';
import 'package:flutter/material.dart';

import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/core/theme/text_styles_data.dart';
import 'package:api_mock/features/creating_page/widgets/creation_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatingContent extends StatefulWidget {
  const CreatingContent({
    Key? key,
    this.item,
    this.isEdidtion = false,
  }) : super(key: key);

  final PostItem? item;
  final bool isEdidtion;

  @override
  State<CreatingContent> createState() => _CreatingPageState();
}

class _CreatingPageState extends State<CreatingContent> {
  late final CreatingCubit creatingCubit;
  String authInitialValue = '';
  // late final String titleInitialValue;
  @override
  void initState() {
    creatingCubit = context.read<CreatingCubit>();
    if (widget.item != null) {
      creatingCubit.onChangeItem(widget.item!);
    }

    super.initState();
  }

  bool isKeyboardActive = false;

  bool get isCreating => widget.item?.id.isEmpty ?? true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isKeyboardActive = mediaQuery.viewInsets.bottom > 0;
    final spacer =
        SizedBox(height: isKeyboardActive ? 6 : mediaQuery.size.height * 0.12);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.isEdidtion ? 'Editing' : 'Add to list',
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
                // textCtrl: isCreating ? authorCtrl : null,
                initialValue: widget.item?.author,
                onChanged: (value) => creatingCubit.onChangeItemAuthor(value),
                // onChanged: (value) => setState(() => authorCtrl.text = value),
              ),
              const SizedBox(height: 20),
              CreationForm(
                label: 'Title',
                // textCtrl: titleCtrl,
                initialValue: creatingCubit.state.item.title,

                onChanged: (value) => creatingCubit.onChangeItemTitle(value),
                // onChanged: (value) => setState(() => titleCtrl.text = value),
              ),
              const SizedBox(height: 20),
              CreationForm(
                label: 'Comments',
                // textCtrl: titleCtrl,
                initialValue:
                    creatingCubit.state.item.commentsQuantity.toString(),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    creatingCubit.onChangeItemCommentNumber(value),
                // onChanged: (value) => setState(() => titleCtrl.text = value),
              ),
              const SizedBox(height: 20),
              CreationForm(
                label: 'Ups',
                // textCtrl: titleCtrl,
                initialValue: creatingCubit.state.item.ups.toString(),
                keyboardType: TextInputType.number,
                onChanged: (value) => creatingCubit.onChangeItemUpNumber(value),
                // onChanged: (value) => setState(() => titleCtrl.text = value),
              ),
              const SizedBox(height: 20),
              spacer,
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          creatingCubit.validToProceed
                              ? AppColors.primary
                              : AppColors.inactiveColor)),
                  onPressed: !creatingCubit.validToProceed
                      ? null
                      : isCreating
                          ? () => creatingCubit.addPost()
                          : () => creatingCubit.updatePost(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      widget.isEdidtion ? Icons.edit : Icons.add,
                      size: widget.isEdidtion ? 20 : 40,
                      color: creatingCubit.validToProceed
                          ? AppColors.primaryLight
                          : AppColors.inactiveColor,
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
