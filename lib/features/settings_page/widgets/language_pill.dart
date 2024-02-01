import 'package:api_mock/core/theme/app_colors.dart';
import 'package:api_mock/core/theme/text_styles_data.dart';
import 'package:flutter/material.dart';

class LanguagePill extends StatelessWidget {
  const LanguagePill({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        backgroundColor:
            isSelected ? AppColors.primary : AppColors.inactiveColor,
        label: Text(
          label,
          style: TextStyleData.languagePill,
        ),
      ),
    );
  }
}
