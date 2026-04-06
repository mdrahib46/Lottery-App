import 'package:flutter/material.dart';
import 'package:loteryapp/core/constants/app_colors.dart';
import 'package:loteryapp/core/constants/app_strings.dart';
import 'package:loteryapp/presentation/provider/lottery_provider.dart';
import 'package:loteryapp/presentation/screens/result_screen.dart';
import 'package:loteryapp/presentation/widgets/gradient_scaffold.dart';
import 'package:loteryapp/presentation/widgets/number_tile.dart';
import 'package:provider/provider.dart';

import '../widgets/gradient_elevated_button.dart';

class LotteryScreen extends StatefulWidget {
  const LotteryScreen({super.key});

  @override
  State<LotteryScreen> createState() => _LotteryScreenState();
}

class _LotteryScreenState extends State<LotteryScreen> {
  int? _selectedNumber;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LotteryProvider>(context);
    return GradientScaffold(
      showBackButton: true,
      title: AppStrings.homeTitle,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Icon(Icons.casino, size: 100, color: AppColors.cyanShadowStrong),
              Text(
                AppStrings.entryHeading,
                style: TextStyle(
                  fontSize: 40,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                AppStrings.entrySubheading,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteOpacity70,
                ),
              ),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
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
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final number = index + 1;
                    return NumberTile(
                      number: number,
                      isSelected: _selectedNumber == number,
                      onTap: () {
                        setState(() => _selectedNumber = number);
                        provider.selectedNumber(number);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              GradientElevatedButton(
                buttonTitle: 'Play Lottery',
                backgroundColor: AppColors.tileGradient,
                foregroundColor: Colors.white,
                onTap: () {
                  provider.playLottery();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultScreen()),
                  );
                },
              ),

              const SizedBox(height: 20),

              Text(
                '✨ Good Luck ✨',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
