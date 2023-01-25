import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizInfoSheets {
  static void quizSuccess(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: BlackBullColors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.55,
          padding: const EdgeInsets.only(left: 27.0, right: 27.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: BlackBullColors.blueDark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    13.verticalGap,
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        alignment: Alignment.topRight,
                        //padding: const EdgeInsets.only(right: 5.0),
                        child: SvgPicture.asset(
                          BlackBullIcons.icCloseButton,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    37.verticalGap,
                    SvgPicture.asset(BlackBullIcons.quizSuccessIcon),
                    31.verticalGap,
                    StandardText.headline1(
                      context,
                      'quiz.quiz_success_title'.tr(),
                      fontWeight: FontWeight.w900,
                      fontSize: 22.0,
                      color: BlackBullColors.white,
                    ),
                    23.verticalGap,
                    StandardText.headline1(
                      context,
                      // 'notifications.subHeading'.tr(),
                      'quiz.quiz_success_description'.tr(),
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                      color: BlackBullColors.white,
                    ),
                    30.verticalGap,
                    AppButton(
                      // text: 'notifications.buttonText'.tr().toUpperCase(),
                      text: 'quiz.continue'.tr().toUpperCase(),
                      borderColor: BlackBullColors.white,
                      color: BlackBullColors.white,
                      enableColor: BlackBullColors.blueDark,
                      textColor: BlackBullColors.blueDark,
                      width: 300,
                      radius: 8.0,
                      onPressed: () {
                        Navigator.of(context).pop();
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          getIt<NavigationService>().navigateToNamed(
                            uri:
                                NavigationService.documentsVerificationRouteUri,
                            beamerDelegate: globalBeamerDelegate,
                          );
                        });
                      },
                    ),
                    26.verticalGap,
                    AppButton(
                      // text: 'notifications.notNowText'.tr(),
                      text: 'quiz.view_answers'.tr(),
                      borderColor: BlackBullColors.transparent,
                      color: BlackBullColors.transparent,
                      textColor: BlackBullColors.white,
                      width: 300,
                      radius: 8.0,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
