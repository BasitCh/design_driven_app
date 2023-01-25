import 'package:black_bull_markets/application/internal_transfer/internal_transfer_bloc/internal_transfer_bloc.dart';
import 'package:black_bull_markets/application/internal_transfer/internal_transfer_bloc/internal_transfer_state.dart';
import 'package:black_bull_markets/application/internal_transfer/internal_transfer_cubit/confirm_transfer_cubit.dart';
import 'package:black_bull_markets/application/internal_transfer/internal_transfer_cubit/custom_stepper_cubit.dart';
import 'package:black_bull_markets/application/internal_transfer/internal_transfer_cubit/internal_transfer_cubit.dart';
import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_appbar.dart';
import 'package:black_bull_markets/presentation/wallet/widgets/wallet_dashboard_header.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/custom_drop_down.dart';
import 'package:black_bull_markets/shared/widgets/custom_stepper.dart'
    // ignore: library_prefixes
    as BSTEPPER;
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternalTransferPage extends StatelessWidget {
  const InternalTransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternalTransferBloc, InternalTransferState>(
      listener: (context, state) {
        if (state is InternalTransferStateLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.internalTransferResponse.message ?? '',
              ),
            ),
          );
          getIt<NavigationService>().navigateToNamed(
            uri: NavigationService.internalTransferSuccessRouteUri,
            beamerDelegate: globalBeamerDelegate,
          );
        }
      },
      child: BaseScaffold(
        bullPath: BlackBullImages.bullGrey,
        appBar: Builder(
          builder: (context) {
            return MyWalletAppBar(
              title: 'internal_transfer.title'.tr(),
              onDrawerPressed: Scaffold.of(context).openDrawer,
              onNotificationPressed: () {},
            );
          },
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Column(
                children: [
                  const WalletDashboardHeader(
                    title: 'internal_transfer.heading',
                    subtitle: 'internal_transfer.subheading',
                  ),
                  20.verticalGap,
                  BlocBuilder<CustomStepperCubit, int>(
                    builder: (BuildContext context, int state) {
                      return BSTEPPER.CustomStepper(
                        physics: const ScrollPhysics(),
                        currentStep: state - 1,
                        onStepTapped:
                            context.read<CustomStepperCubit>().onStepTapped,
                        onStepContinue: () => context
                            .read<CustomStepperCubit>()
                            .continued(context),
                        onStepCancel: context.read<CustomStepperCubit>().cancel,
                        controlsBuilder: (
                          BuildContext context,
                          _,
                        ) {
                          return const SizedBox.shrink();
                        },
                        steps: <BSTEPPER.Step>[
                          BSTEPPER.Step(
                            title: StandardText.headline4(
                              context,
                              'Details:',
                              fontSize: 16,
                            ),
                            content: Column(
                              children: <Widget>[
                                CustomDropDown(
                                  dropDownItem: const [
                                    'Type from 1',
                                    'Type from 2',
                                    'Type from 3',
                                  ],
                                  dropdownValue: '',
                                  onChangedValue: (val) {
                                    context
                                        .read<InternalTransferCubit>()
                                        .onChangeFromAccountName(val);
                                    if (kDebugMode) {
                                      print(val);
                                    }
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  width: double.infinity,
                                ),
                                8.verticalGap,
                                CustomDropDown(
                                  dropDownItem: const [
                                    'Type from 1',
                                    'Type from 2',
                                    'Type from 3',
                                  ],
                                  dropdownValue: '',
                                  onChangedValue: (val) {
                                    context
                                        .read<InternalTransferCubit>()
                                        .onChangeFromWalletName(val);
                                    if (kDebugMode) {
                                      print(val);
                                    }
                                  },
                                  width: double.infinity,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                ),
                                8.verticalGap,
                                CustomDropDown(
                                  dropDownItem: const [
                                    'Type from 1',
                                    'Type from 2',
                                    'Type from 3',
                                  ],
                                  dropdownValue: '',
                                  onChangedValue: (val) {
                                    context
                                        .read<InternalTransferCubit>()
                                        .onChangeToAccountName(val);
                                    if (kDebugMode) {
                                      print(val);
                                    }
                                  },
                                  width: double.infinity,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                ),
                                8.verticalGap,
                                CustomDropDown(
                                  dropDownItem: const [
                                    'Type from 1',
                                    'Type from 2',
                                    'Type from 3',
                                  ],
                                  width: double.infinity,
                                  dropdownValue: '',
                                  onChangedValue: (val) {
                                    context
                                        .read<InternalTransferCubit>()
                                        .onChangeToWalletName(val);
                                    if (kDebugMode) {
                                      print(val);
                                    }
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                ),
                                12.verticalGap,
                                AppButton(
                                  text: 'Next',
                                  width: 100,
                                  height: 30,
                                  radius: 5,
                                  textSize: 14,
                                  onPressed: () => context
                                      .read<CustomStepperCubit>()
                                      .continued(context),
                                  color: BlackBullColors.black,
                                  textColor: BlackBullColors.white,
                                ),
                                8.verticalGap,
                              ],
                            ),
                            isActive: state >= 0,
                            state: state >= 0
                                ? BSTEPPER.StepState.complete
                                : BSTEPPER.StepState.disabled,
                          ),
                          BSTEPPER.Step(
                            title: StandardText.headline4(
                              context,
                              'Enter amount (NZD):',
                              fontSize: 16,
                            ),
                            content: Column(
                              children: <Widget>[
                                StandardTextField(
                                  hintText: '50 (In digits only) ',
                                  keyboardType: TextInputType.number,
                                  inputFormatter: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: context
                                      .read<InternalTransferCubit>()
                                      .onChangeAmount,
                                ),
                                8.verticalGap,
                              ],
                            ),
                            isActive: state >= 0,
                            state: state >= 2
                                ? BSTEPPER.StepState.complete
                                : BSTEPPER.StepState.disabled,
                          ),
                        ],
                      );
                    },
                  ),
                  20.verticalGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      BlocBuilder<ConfirmTransferCubit, bool>(
                        builder: (context, state) {
                          return Checkbox(
                            checkColor: BlackBullColors.inputFiledHintColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              return BlackBullColors.white;
                            }),
                            activeColor: BlackBullColors.white,
                            value: state,
                            onChanged:
                                context.read<ConfirmTransferCubit>().onTap,
                          );
                        },
                      ),
                      StandardText.headline1(
                        context,
                        'internal_transfer.check'.tr(),
                        fontWeight: FontWeight.w600,
                        fontSize: 13.0,
                      ),
                    ],
                  ),
                  20.verticalGap,
                  BlocBuilder<ConfirmTransferCubit, bool>(
                    builder: (context, state) {
                      if (kDebugMode) {
                        print(state);
                      }
                      return AppButton(
                        width: double.infinity,
                        color: state
                            ? BlackBullColors.green
                            : BlackBullColors.whiteBackground,
                        text: 'internal_transfer.button_text'.tr(),
                        radius: 5,
                        onPressed: () => state
                            ? context.read<CustomStepperCubit>().continued(
                                  context,
                                  internalTransfer: context
                                      .read<InternalTransferCubit>()
                                      .state,
                                )
                            : null,
                        textColor: BlackBullColors.white,
                        isLoading: context.read<InternalTransferBloc>().state ==
                                InternalTransferStateLoading()
                            ? true
                            : false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // color: Colors./Colorspink,
        ),
      ),
    );
  }
}
