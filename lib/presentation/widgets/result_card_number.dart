import 'package:flutter/material.dart';
import 'package:loteryapp/core/constants/app_colors.dart';
import 'package:loteryapp/core/constants/app_strings.dart';
import 'package:loteryapp/domain/entities/lottery_result.dart';

class ResultCardNumber extends StatelessWidget {
  const ResultCardNumber({super.key, required this.lotteryResult});
  final LotteryResult lotteryResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.whiteOpacity15,
        border: Border.all(color: AppColors.whiteOpacity30),
      ),
      child: Column(
        children: [
          _buildNumberCircle(
            AppStrings.yourNumber,
            lotteryResult.lotteryNumber,
            AppColors.blueAccent,
            Icons.person,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Divider(color: AppColors.whiteOpacity50, thickness: 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  AppStrings.vsLabel,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteOpacity80,
                  ),
                ),
              ),
              Expanded(
                child: Divider(color: AppColors.whiteOpacity50, thickness: 1),
              ),
            ],
          ),
          const SizedBox(height: 20),

          _buildNumberCircle(
            AppStrings.winningNumber,
            lotteryResult.winningNumber,
            lotteryResult.isWinner
                ? AppColors.accentCyan
                : AppColors.purpleAccent,
            Icons.star,
          ),
        ],
      ),
    );
  }

  Widget _buildNumberCircle(
    String label,
    int number,
    Color color,
    IconData icon,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [color, color.withOpacity(0.7)]),
          ),
          child: Center(
            child: Text(
              "$number",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
