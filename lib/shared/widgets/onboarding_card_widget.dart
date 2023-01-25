import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({required this.body, Key? key}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
      color: BlackBullColors.lightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 10.0,
        ),
        child: body,
      ),
    );
  }
}
