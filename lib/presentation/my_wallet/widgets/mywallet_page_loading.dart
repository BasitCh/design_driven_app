import 'package:black_bull_markets/shared/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class MyWalletPageLoading extends StatelessWidget {
  const MyWalletPageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ShimmerContainer(
      type: ShimmerType.square,
      width: 280,
      height: 350,
    );
  }
}
