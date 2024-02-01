import 'package:api_mock/app/app_cubit.dart';
import 'package:api_mock/core/theme/app_colors.dart';
import 'package:api_mock/features/creating_page/creating_page.dart';
import 'package:api_mock/features/home_page/home_page.dart';
import 'package:api_mock/features/home_page/parts/home_nav_bar.dart';
import 'package:api_mock/features/home_page/parts/home_scaffold.dart';
import 'package:api_mock/features/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSkeleton extends StatefulWidget {
  const AppSkeleton({super.key});

  @override
  State<AppSkeleton> createState() => _AppSkeletonState();
}

class _AppSkeletonState extends State<AppSkeleton> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      bottomNavigationBar: HomeNavBar(
        currentIndex: context.watch<AppCubit>().state.index,
        onTap: (index) => context.read<AppCubit>().navigatePage(index),
      ),
      child: _returnProperPage(),
    );
  }

  Widget _returnProperPage() {
    final index = context.read<AppCubit>().state.index;
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const CreatingPage();
      default:
        return const SettingsPage();
    }
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
