import 'package:flutter/material.dart';

class GradientElevatedButton extends StatelessWidget {
  const GradientElevatedButton({
    super.key,
    required this.buttonTitle,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onTap, this.icon = Icons.play_arrow,
  });

  final String buttonTitle;
  final List<Color> backgroundColor;
  final Color foregroundColor;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: backgroundColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon( icon, color: foregroundColor, size: 32),
                const SizedBox(width: 8,),
                Text(
                  buttonTitle,
                  style: TextStyle(
                    color: foregroundColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
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
