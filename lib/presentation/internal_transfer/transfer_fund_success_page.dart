import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_appbar.dart';
import 'package:black_bull_markets/presentation/wallet/widgets/wallet_dashboard_header.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/text_styles.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TransferFundSuccessPage extends StatelessWidget {
  const TransferFundSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: BlackBullColors.accent,
      appBar: Builder(
        builder: (context) {
          return MyWalletAppBar(
            backgroundColor: BlackBullColors.accent,
            onNotificationPressed: () {},
            onDrawerPressed: Scaffold.of(context).openDrawer,
            title: 'internal_transfer.title'.tr(),
            isAccentColor: true,
          );
        },
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Column(
          children: [
            const WalletDashboardHeader(
              title: 'internal_transfer.heading',
              subtitle: '',
              titleColor: BlackBullColors.textColorWhite,
            ),
            70.verticalGap,
            const Icon(
              Icons.fact_check,
              size: 80,
              color: BlackBullColors.white,
            ),
            20.verticalGap,
            const WalletDashboardHeader(
              title: 'internal_transfer.success_heading',
              subtitle: '',
              titleColor: BlackBullColors.textColorWhite,
            ),
            RichText(
              text: TextSpan(
                text: 'Your funds of ',
                style: BlackBullTextStyle.headline5.copyWith(
                  color: BlackBullColors.textColorWhite,
                ),
                children: const [
                  TextSpan(text: ''), // amount and currency
                  TextSpan(text: 'has been transferred to account '),
                  TextSpan(text: ''), // to account name
                  TextSpan(text: 'from account '),
                  TextSpan(text: ''), // from account name
                ],
              ),
              // maxLines: 3,
            ),
            // StandardText.headline5(
            //   context,
            //   subtitle.tr(),
            //   color: subtitleColor,
            //   maxLines: 3,
            // ),
            40.verticalGap,
            AppButton(
              width: double.infinity,
              text: 'internal_transfer.make_another_transfer'.tr(),
              radius: 5,
              onPressed: () {
                if (kDebugMode) {
                  print('make another transfer');
                }
                getIt<NavigationService>().navigateToNamed(
                  beamerDelegate: globalBeamerDelegate,
                  uri: NavigationService.internalTransferRouteUri,
                );
              },
              color: BlackBullColors.white,
              enableColor: BlackBullColors.accent,
            )
          ],
        ),
      ),
    );
  }
}
