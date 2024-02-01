import 'package:api_mock/features/home_page/cubit/home_cubit.dart';
import 'package:api_mock/features/home_page/parts/add_new_item_action_button.dart';
import 'package:api_mock/features/home_page/parts/home_page_content.dart';
import 'package:api_mock/features/home_page/parts/home_nav_bar.dart';
import 'package:api_mock/features/home_page/parts/home_scaffold.dart';
import 'package:api_mock/features/settings_page/settings_page.dart';
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

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is HomeErrorState) {
          CustomErrorSnackbar.showErrorSnackbar(context, 'Error');
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const CustomLoadingSpinner();
          }

          return HomeScaffold(
            floatingActionButton: _currentIndex == 0
                ? const AddNewItemActionButton()
                : const SizedBox.shrink(),
            bottomNavigationBar: HomeNavBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
            ),
            child: _returnProperPage(_currentIndex, state),
          );
        },
      ),
    );
  }

  Widget _returnProperPage(int index, HomeState state) {
    final List<Widget> pages = [
      HomePageContent(state),
      const SettingsPage(),
    ];
    return pages[index];
  }
}

class CustomErrorSnackbar {
  static void showErrorSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error, color: Colors.white),
            SizedBox(width: 8),
            Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
