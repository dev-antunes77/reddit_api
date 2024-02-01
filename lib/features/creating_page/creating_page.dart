import 'package:api_mock/app/app_cubit.dart';
import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/features/creating_page/cubit/creating_cubit.dart';
import 'package:api_mock/features/creating_page/parts/creating_content.dart';
import 'package:api_mock/features/home_page/home_page.dart';
import 'package:api_mock/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatingPage extends StatefulWidget {
  const CreatingPage({super.key, this.item, this.isEdidtion = false});

  final PostItem? item;
  final bool isEdidtion;

  @override
  State<CreatingPage> createState() => _CreatingPageState();
}

class _CreatingPageState extends State<CreatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<CreatingCubit, CreatingState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is CreatingSuccessState) {
              context.read<AppCubit>().navigatePage(0);
            } else if (state is CreatingErrorState) {
              CustomErrorSnackbar.showErrorSnackbar(context, 'error');
            }
          },
          child: BlocBuilder<CreatingCubit, CreatingState>(
            builder: (context, state) {
              if (state is CreatingLoadingState) {
                return const CustomLoadingSpinner();
              }
              return CreatingContent(
                item: widget.item,
                isEdidtion: widget.isEdidtion,
              );
            },
          ),
        ),
      ),
    );
  }
}
