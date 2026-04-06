import 'package:flutter/material.dart';
import 'package:loteryapp/core/contants/app_strings.dart';
import 'package:loteryapp/presentation/screens/lottery_screen.dart';
import 'package:loteryapp/presentation/widgets/gradient_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: AppStrings.homeTitle,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.homeTagline),
            Text(AppStrings.homeEmoji),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LotteryScreen()),
              ),
              child: Text(AppStrings.playLotteryButton),
            ),
          ],
        ),
      ),
    );
  }
}
