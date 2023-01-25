import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyWalletAppBar extends StatelessWidget {
  const MyWalletAppBar({
    Key? key,
    this.title = '',
    required this.onDrawerPressed,
    required this.onNotificationPressed,
    this.backgroundColor,
    this.isAccentColor = false,
  }) : super(key: key);

  final String? title;
  final VoidCallback onDrawerPressed;
  final VoidCallback onNotificationPressed;
  final Color? backgroundColor;
  final bool isAccentColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:isAccentColor?BlackBullColors.accent: backgroundColor ?? BlackBullColors.primary,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: onDrawerPressed,
        icon: SvgPicture.asset(
          BlackBullIcons.drawer,
          fit: BoxFit.cover,
          color: isAccentColor ? BlackBullColors.white : null,
        ),
      ),
      iconTheme: IconThemeData(
        color: isAccentColor ? BlackBullColors.white : null,
      ),
      actions: const [
        // IconButton(
        //   onPressed: onNotificationPressed,
        //   icon: SvgPicture.asset(
        //     BlackBullIcons.notification,
        //     fit: BoxFit.cover,
        //     color: isAccentColor ? BlackBullColors.white : null,
        //   ),
        // )
      ],
      title: StandardText.headline6(
        context,
        title!,
        color: isAccentColor ? BlackBullColors.white : BlackBullColors.black,
        // 'my_wallet.title'.tr(),
      ),
    );
  }
}
