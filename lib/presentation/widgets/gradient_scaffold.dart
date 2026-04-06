import 'package:flutter/material.dart';
import 'package:loteryapp/core/contants/app_colors.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({
    super.key,
    required this.title,
    required this.body,
    this.showBackButton = false,
    this.gradientColors,
  });

  final String title;
  final Widget body;
  final bool showBackButton;
  final List<Color>? gradientColors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: showBackButton,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.white),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors ?? AppColors.primaryGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: body,
      ),
    );
  }
}
