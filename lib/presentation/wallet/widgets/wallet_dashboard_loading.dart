import 'package:black_bull_markets/shared/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class WalletDashboardLoading extends StatelessWidget {
  const WalletDashboardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) => const ShimmerContainer(
        type: ShimmerType.square,
      ),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
    );
  }
}
