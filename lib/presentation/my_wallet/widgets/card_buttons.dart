import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardButtons extends StatelessWidget {
  const CardButtons({
    Key? key,
    required this.isAddFundsPage,
  }) : super(key: key);
  final bool isAddFundsPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: isAddFundsPage?null:() => getIt<NavigationService>().navigateToNamed(
              beamerDelegate: globalBeamerDelegate,
              uri: NavigationService.addFundsRouteUri,
            ),
            child: const _CardButton(),
          ),
          Flexible(
            child: 24.horizontalGap,
          ),
          GestureDetector(
            onTap: isAddFundsPage?null:() => getIt<NavigationService>().navigateToNamed(
                beamerDelegate: globalBeamerDelegate,
                uri: NavigationService.internalTransferRouteUri,
              ),
            child: const _CardButton(
              color: BlackBullColors.black,
              imageUrl: BlackBullIcons.internalTransferWhite,
              buttonTitle: 'Internal Transfer',
            ),
          ),
        ],
      ),
    );
  }
}

class _CardButton extends StatelessWidget {
  const _CardButton({
    Key? key,
    this.color = BlackBullColors.tertiary,
    this.imageUrl = BlackBullIcons.addCircle,
    this.buttonTitle = 'Add Funds',
  }) : super(key: key);
  final Color color;
  final String imageUrl;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(imageUrl),
        ),
        4.verticalGap,
        StandardText.headline5(
          context,
          buttonTitle,
          color: BlackBullColors.black,
          fontSize: 10,
        ),
      ],
    );
  }
}
