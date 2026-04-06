import 'package:flutter/material.dart';
import 'package:loteryapp/core/constants/app_colors.dart';
import 'package:loteryapp/core/constants/app_strings.dart';
import 'package:loteryapp/presentation/screens/lottery_screen.dart';
import 'package:loteryapp/presentation/widgets/gradient_elevated_button.dart';
import 'package:loteryapp/presentation/widgets/gradient_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      showBackButton: false,
      title: AppStrings.homeTitle,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 60),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: AppColors.accentGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cyanShadowStrong,
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.casino, color: AppColors.white, size: 100),
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(26),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: AppColors.whiteOpacity30),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackOpacity10,
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: AppColors.glassGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mini",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteOpacity90,
                      ),
                    ),
                    Text(
                      "Lottery",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteOpacity90,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        AppStrings.homeTagline,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteOpacity50,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        AppStrings.homeEmoji,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ],
                ),
              ),

              GradientElevatedButton(
                buttonTitle: 'Play Lottery',
                backgroundColor: AppColors.accentGradient,
                foregroundColor: AppColors.primaryPurpleDark,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LotteryScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
