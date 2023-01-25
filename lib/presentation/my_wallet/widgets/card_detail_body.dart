import 'package:black_bull_markets/domain/my_wallet/my_wallet.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDetailBody extends StatelessWidget {
  const CardDetailBody({
    Key? key,
    required this.myWallet,
    this.isAddFundsView=false,
  }) : super(key: key);

  final MyWallet myWallet;
  final bool isAddFundsView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            BlackBullIcons.flag,
            width: 30,
            height: 30,
          ),
          _HeadingAndContent(
            heading: myWallet.name ?? '-',
            isAddFundsView: isAddFundsView,
          ),
          _HeadingAndContent(
            heading: myWallet.currency ?? '-',
            content: 'my_wallet.currency'.tr(),
            isAddFundsView: isAddFundsView,
          ),
        ],
      ),
    );
  }
}

class _HeadingAndContent extends StatelessWidget {
  const _HeadingAndContent({
    Key? key,
    this.heading = 'Oliver',
    this.content,
    required this.isAddFundsView,
  }) : super(key: key);
  final String heading;
  final String? content;
  final bool isAddFundsView;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StandardText.headline5(
          context,
          heading,
          align: TextAlign.start,
          color: isAddFundsView?BlackBullColors.tertiary:BlackBullColors.textColor,
        ),
        2.verticalGap,
        StandardText.body2(
          context,
          content??'my_wallet.name'.tr(),
          align: TextAlign.start,
          fontSize: 11.4,
        ),
      ],
    );
  }
}
