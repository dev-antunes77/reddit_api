import 'package:api_mock/core/l10n/generated/l10n.dart';
import 'package:api_mock/core/theme/app_colors.dart';
import 'package:api_mock/features/home_page/cubit/home_cubit.dart';
import 'package:api_mock/features/home_page/parts/home_page_content.dart';
import 'package:api_mock/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final cubit = context.read<HomeCubit>();
    cubit.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is HomeErrorState) {
          CustomErrorSnackbar.showErrorSnackbar(
              context, AppLocalizations.current.error);
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const CustomLoadingSpinner();
          }

          return HomePageContent(state);
        },
      ),
    );
  }
}

class CustomErrorSnackbar {
  static void showErrorSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: AppColors.primaryLight),
            const SizedBox(width: 8),
            Text(
              errorMessage,
              style: const TextStyle(color: AppColors.primaryLight),
            ),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
