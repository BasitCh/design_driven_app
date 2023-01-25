import 'package:black_bull_markets/application/add_funds/add_funds_cubit/add_funds_card_cubit.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/add_funds_number_cubit.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/amount_alert_box_cubit.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/confirmation_alert_box_cubit.dart';
import 'package:black_bull_markets/application/my_wallet/my_wallet_bloc/my_wallet_bloc.dart';
import 'package:black_bull_markets/application/my_wallet/my_wallet_cubit/carousel_cubit.dart';
import 'package:black_bull_markets/domain/my_wallet/my_wallet.dart';
import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/add_funds_header.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/add_funds_subheader.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/amount_alert_item.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/amount_detail.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/confirmation_detail.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/funding_detail.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/carousel_wallet_cards_with_number.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_appbar.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_page_loading.dart';
import 'package:black_bull_markets/shared/enums/alert_type.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFundsPage extends StatelessWidget {
  const AddFundsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MyWalletBloc>().add(
          FetchMyWalletItems(
            isAddFundsPage: true,
          ),
        );
    return BaseScaffold(
      appBar: BlocBuilder<AddFundsNumberCubit, int>(
        builder: (context, index) {
          return MyWalletAppBar(
            onDrawerPressed: Scaffold.of(context).openDrawer,
            onNotificationPressed: () {},
            title: index == 1
                ? 'add_funds.title1'.tr()
                : index == 2
                    ? 'add_funds.title2'.tr()
                    : index == 3
                        ? 'add_funds.title3'.tr()
                        : 'add_funds.title4'.tr(),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: BlocBuilder<AddFundsNumberCubit, int>(
            builder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<AddFundsCardCubit, MyWallet>(
                    builder: (context, myWallet) {
                      return index == 1
                          ? AddFundsHeader(
                              title: 'add_funds.headline1'.tr(),
                            )
                          : AddFundsHeader(
                              title: 'add_funds.headline1'.tr(),
                              detailText:
                                  '${myWallet.name} (${myWallet.currency})',
                            );
                    },
                  ),
                  BlocBuilder<AmountAlertBoxCubit, bool?>(
                    builder: (context, isBoxVisible) {
                      return AmountAlertItem(
                        title: 'add_funds.error'.tr(),
                        description: 'add_funds.error_detail'.tr(),
                        isVisible:
                            index == 3 && isBoxVisible != null && isBoxVisible,
                        onCloseAlert: () {
                          context.read<AmountAlertBoxCubit>().hideAlert();
                        },
                      );
                    },
                  ),
                  BlocBuilder<ConfirmationAlertBoxCubit, bool?>(
                    builder: (context, isBoxVisible) {
                      return AmountAlertItem(
                        type: AmountAlertType.Info,
                        title: 'add_funds.info_heading'.tr(),
                        description: 'add_funds.info_desc'.tr(),
                        isVisible:
                            index == 4 && isBoxVisible != null && isBoxVisible,
                        onCloseAlert: () {
                          context.read<ConfirmationAlertBoxCubit>().hideAlert();
                        },
                      );
                    },
                  ),
                  NumberStepper(
                    totalSteps: 4,
                    width: MediaQuery.of(context).size.width,
                    curStep: index,
                    stepCompleteColor: BlackBullColors.tertiary,
                    currentStepColor: BlackBullColors.accent,
                    inactiveColor: BlackBullColors.transparent,
                    lineWidth: 3.5,
                  ),

                  20.verticalGap,
                  index == 1
                      ? const AddFundsSubheader(
                          title: 'add_funds.subHeadline1',
                          subtitle: 'add_funds.description1',
                        )
                      : index == 2
                          ? const AddFundsSubheader(
                              title: 'add_funds.funding_title',
                              subtitle: 'add_funds.funding_subtitle',
                            )
                          : index == 3
                              ? const AddFundsSubheader(
                                  title: 'add_funds.amount_title',
                                  subtitle: 'add_funds.amount_subtitle',
                                )
                              : const AddFundsSubheader(
                                  title: 'add_funds.confirmation_title',
                                  subtitle: 'add_funds.confirmation_subtitle',
                                ),
                  20.verticalGap,
                  index == 1
                      ? BlocBuilder<MyWalletBloc, MyWalletState>(
                          builder: (context, state) {
                            if (state is MyWalletStateLoading) {
                              return const MyWalletPageLoading();
                            } else if (state is MyWalletStateLoaded) {
                              if (state.myWalletResponse.myWallets != null &&
                                  state
                                      .myWalletResponse.myWallets!.isNotEmpty) {
                                context
                                    .read<AddFundsCardCubit>()
                                    .onWalletSelected(
                                      myWallet: state
                                              .myWalletResponse.myWallets![
                                          context.read<CarouselCubit>().state],
                                    );
                              }
                              return CarouselWalletCardsWithNumber(
                                widgets: state.sliderWidgets,
                                myWallet:
                                    state.myWalletResponse.myWallets ?? [],
                                isAddFundsPage: true,
                              );
                            } else if (state is MyWalletStateError) {
                              return Center(
                                child:
                                    StandardText.body1(context, state.message),
                              );
                            } else {
                              return Container();
                            }
                          },
                        )
                      : index == 2
                          ? const FundingDetailBody()
                          : index == 3
                              ? const AmountDetail()
                              : const ConfirmationDetail(),
                  // 20.verticalGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: index != 1,
                          child: AppButton(
                            text: 'add_funds.previous'.tr(),
                            width: 152,
                            radius: 8,
                            color: BlackBullColors.borderColor,
                            borderColor: BlackBullColors.borderColor,
                            onPressed: context
                                .read<AddFundsNumberCubit>()
                                .onPreviousPage,
                          ),
                        ),
                        Visibility(
                          visible: index != 1,
                          child: 8.horizontalGap,
                        ),
                        AppButton(
                          text: index == 4
                              ? 'accounts.submit'.tr().toUpperCase()
                              : 'add_funds.next'.tr(),
                          width: 152,
                          radius: 8,
                          onPressed: () async {
                            if (index == 3 &&
                                context.read<AmountAlertBoxCubit>().state ==
                                    null) {
                              context.read<AmountAlertBoxCubit>().showAlert();
                            } else {
                              context.read<AddFundsNumberCubit>().onNextPage();
                            }
                            if (index == 4) {
                              await context
                                  .read<ConfirmationAlertBoxCubit>()
                                  .showAlert();
                              getIt<NavigationService>().navigateToNamed(
                                uri: NavigationService.addFundsSuccessRouteUri,
                                beamerDelegate: globalBeamerDelegate,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
