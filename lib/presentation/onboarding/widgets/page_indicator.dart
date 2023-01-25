import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? BlackBullColors.accent : const Color(0XFFABA8A8),
        ),
      ),
    );
  }
}
