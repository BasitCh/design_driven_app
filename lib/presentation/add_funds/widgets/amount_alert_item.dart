import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/enums/alert_type.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/font_weights.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AmountAlertItem extends StatelessWidget {
  const AmountAlertItem({
    Key? key,
    required this.title,
    required this.description,
    this.type = AmountAlertType.Error,
    this.isVisible = true,
    required this.onCloseAlert,
  }) : super(key: key);
  final String title;
  final String description;
  final AmountAlertType type;
  final bool isVisible;
  final VoidCallback onCloseAlert;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 21,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: type ==AmountAlertType.Error?BlackBullColors.alertBox:BlackBullColors.infoBox,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: SvgPicture.asset(
                type==AmountAlertType.Error?BlackBullIcons.icAlert:BlackBullIcons.icInfo,
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StandardText.subtitle2(
                    context,
                    title,
                    fontWeight: BlackBullFontWeight.black,
                    color: type==AmountAlertType.Error?BlackBullColors.alertBoxText:BlackBullColors.infoBoxText,
                  ),
                  StandardText.subtitle2(
                    context,
                    description,
                    fontSize: 12,
                    fontWeight: BlackBullFontWeight.regular,
                    color: type==AmountAlertType.Error?BlackBullColors.alertBoxText:BlackBullColors.infoBoxText,
                  ),
                ],
              ),
            ),
            Flexible(
              child: IconButton(
                onPressed: onCloseAlert,
                icon: Icon(
                  Icons.close,
                  color: type==AmountAlertType.Error?BlackBullColors.alertBoxText:BlackBullColors.infoBoxText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
