import 'package:flutter/material.dart';
import 'package:loteryapp/core/contants/app_colors.dart';

class NumberTile extends StatelessWidget {
  const NumberTile({
    super.key,
    required this.number,
    required this.isSelected,
    required this.onTap,
  });

  final int number;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: isSelected
              ? LinearGradient(colors: AppColors.accentGradient)
              : LinearGradient(colors: AppColors.tileGradient),
          border: Border.all(
            color: isSelected
                ? AppColors.accentCyanLight
                : AppColors.whiteOpacity15,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: AppColors.blackOpacity10,
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ] : [],
        ),
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : AppColors.whiteOpacity90,
            ),
          ),
        ),
      ),
    );
  }
}
