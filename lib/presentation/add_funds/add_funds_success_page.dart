import 'package:black_bull_markets/application/add_funds/add_funds_bloc/add_funds_bloc.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/add_funds_card_cubit.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/payement_card_cubit.dart';
import 'package:black_bull_markets/domain/add_funds/request/add_funds.dart';
import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_appbar.dart';
import 'package:black_bull_markets/presentation/wallet/widgets/wallet_dashboard_header.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/font_weights.dart';
import 'package:black_bull_markets/shared/helpers/typography/text_styles.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/custom_loading.dart';
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFundsSuccessPage extends StatelessWidget {
  const AddFundsSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AddFundsBloc>().add(
          SubmitTransferFunds(
            addFunds: AddFunds(
              amount: AddFundsBloc.amountTextEditingController.text,
              paymentCard: context.read<PaymentCardCubit>().state,
              myWallet: context.read<AddFundsCardCubit>().state,
            ),
          ),
        );
    return BaseScaffold(
      backgroundColor: BlackBullColors.accent,
      appBar: Builder(
        builder: (context) {
          return MyWalletAppBar(
            onDrawerPressed: Scaffold.of(context).openDrawer,
            onNotificationPressed: () {},
            isAccentColor: true,
            title: 'signUp.success'.tr(),
          );
        },
      ),
      body: BlocBuilder<AddFundsBloc, AddFundsState>(
        builder: (BuildContext context, AddFundsState state) {
          if (state is AddFundsStateAdding) {
            return const _AddFundsSuccessLoading();
          } else if (state is AddFundsStateAdded) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  const WalletDashboardHeader(
                    title: 'add_funds.headline1',
                    subtitle: '',
                    titleColor: BlackBullColors.textColorWhite,
                  ),
                  NumberStepper(
                    totalSteps: 4,
                    width: MediaQuery.of(context).size.width,
                    curStep: 4,
                    stepCompleteColor: BlackBullColors.tertiary,
                    currentStepColor: BlackBullColors.tertiary,
                    isLast: true,
                    inactiveColor: BlackBullColors.transparent,
                    lineWidth: 3.5,
                    dashColor: BlackBullColors.white,
                  ),
                  30.verticalGap,
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
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Your funds of ',
                      style: BlackBullTextStyle.headline5.copyWith(
                        color: BlackBullColors.textColorWhite,
                      ),
                      children: [
                        TextSpan(
                          text: ' 50 NZD  ',
                          style: BlackBullTextStyle.headline5.copyWith(
                            color: BlackBullColors.tertiary,
                            fontWeight: BlackBullFontWeight.extraBold,
                          ),
                        ),
                        // amount and currency
                        const TextSpan(
                          text:
                              'has been added \n successfully \n to the wallet',
                        ),
                        TextSpan(
                          text: ' Oliver, NZD  ',
                          style: BlackBullTextStyle.headline5.copyWith(
                            color: BlackBullColors.tertiary,
                            fontWeight: BlackBullFontWeight.extraBold,
                          ),
                        ),
                        // to account name
                      ],
                    ),
                  ),
                  10.verticalGap,
                  StandardText.headline5(
                    context,
                    'add_funds.funds_added_description'.tr(),
                    color: BlackBullColors.textColorWhite,
                  ),
                  30.verticalGap,
                  AppButton(
                    width: double.infinity,
                    text: 'add_funds.my_wallets'.tr(),
                    radius: 5,
                    onPressed: () {
                      if (kDebugMode) {
                        print('make another transfer');
                      }
                      getIt<NavigationService>().replaceWithNamed(
                        beamerDelegate: globalBeamerDelegate,
                        uri: NavigationService.walletRouteUri,
                      );
                    },
                    color: BlackBullColors.white,
                    enableColor: BlackBullColors.accent,
                  )
                ],
              ),
            );
          } else if (state is AddFundsStateError) {
            return Center(
              child: StandardText.headline5(
                context,
                state.message,
              ),
            );
          }
          return const Center(
            child: Text(
              'Something went wrong',
            ),
          );
        },
      ),
    );
  }
}

class _AddFundsSuccessLoading extends StatelessWidget {
  const _AddFundsSuccessLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StandardText.headline4(
          context,
          'add_funds.deposit_status'.tr(),
          color: BlackBullColors.textColorWhite,
        ),
        200.verticalGap,
        Center(
          child: Column(
            children: <Widget>[
              CustomLoading(
                title: 'add_funds.loading'.tr(),
                color: BlackBullColors.white,
              ),
              4.verticalGap,
              StandardText.caption(
                context,
                'add_funds.please_wait'.tr(),
                color: BlackBullColors.textColorWhite,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
