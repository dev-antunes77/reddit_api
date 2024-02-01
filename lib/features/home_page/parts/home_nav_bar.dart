import 'package:api_mock/core/l10n/generated/l10n.dart';
import 'package:api_mock/core/theme/icon_theme_data.dart';
import 'package:flutter/material.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 14,
      selectedFontSize: 16,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      unselectedFontSize: 12,
      selectedIconTheme: CustomIconTheme.primaryIconTheme,
      unselectedIconTheme: CustomIconTheme.secondaryIconTheme,
      unselectedItemColor: Colors.grey[600],
      backgroundColor: Colors.grey[800],
      currentIndex: currentIndex,
      onTap: (index) => onTap(index),
      items: [
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.home,
            size: 26,
          ),
          label: AppLocalizations.current.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.edit,
            size: 26,
          ),
          label: AppLocalizations.current.editing,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.settings,
            size: 26,
          ),
          label: AppLocalizations.current.settings,
        ),
      ],
    );
  }
}
