import 'package:flutter/material.dart';
import 'package:loteryapp/core/constants/app_colors.dart';
import 'package:loteryapp/core/constants/app_strings.dart';
import 'package:loteryapp/presentation/provider/lottery_provider.dart';
import 'package:loteryapp/presentation/widgets/gradient_scaffold.dart';
import 'package:loteryapp/presentation/widgets/result_card_number.dart';
import 'package:loteryapp/presentation/widgets/result_icon.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // result = provider.getL
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LotteryProvider>();
    final result = provider.getLotteryResult;

    if (result == null) {
      return GradientScaffold(
        showBackButton: true,
        title: AppStrings.resultTitle,
        body: Center(child: Text(AppStrings.noResultFound)),
      );
    }

    return GradientScaffold(
      showBackButton: true,
      title: AppStrings.resultTitle,
      gradientColors: result.isWinner ? AppColors.winGradient : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                ResultIcon(isWinner: result.isWinner),
                const SizedBox(height: 16),
                Text(
                  result.isWinner ? 'You Win !' : 'Better Luck Next Time !',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ResultCardNumber(lotteryResult: result),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    provider.resetLottery();
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.refresh_rounded, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text('Try again', style: TextStyle(color: AppColors.purpleAccent),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
