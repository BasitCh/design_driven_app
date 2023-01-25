import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    this.icon,
    this.onPressed,
    Key? key,
    this.height = 50,
    this.width = 234,
    this.radius = 0,
    this.color,
    this.borderColor,
    this.textColor = Colors.white,
    this.textSize = 16.0,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.w800,
    this.leftHalfRadius = false,
    this.rightHalfRadius = false,
    this.letterSpacing = 0,
    this.isLoading = false,
    this.enableColor,
    this.isPrefixIcon = true,
  }) : super(key: key);

  /// text does not show if child is given.
  final String text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final Color? enableColor;
  final double textSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double height;
  final double width;
  final double radius;
  final Color? borderColor;
  final bool leftHalfRadius;
  final bool rightHalfRadius;
  final double? letterSpacing;
  final bool isLoading;
  final bool isPrefixIcon;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: color ??
            (isEnabled ? BlackBullColors.green : BlackBullColors.white),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(leftHalfRadius ? 0 : radius),
          right: Radius.circular(rightHalfRadius ? 0 : radius),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          //foregroundColor: BlackBullColors.white,
          disabledBackgroundColor: color ??
              (isEnabled ? BlackBullColors.transparent : BlackBullColors.white),
          backgroundColor: color ??
              (isEnabled ? BlackBullColors.transparent : BlackBullColors.white),

          // make the button as small as possible
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 0,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(leftHalfRadius ? 0 : radius),
              bottomLeft: Radius.circular(leftHalfRadius ? 0 : radius),
              topRight: Radius.circular(rightHalfRadius ? 0 : radius),
              bottomRight: Radius.circular(rightHalfRadius ? 0 : radius),
            ),
            side: BorderSide(
              color: borderColor ??
                  (isEnabled
                      ? BlackBullColors.transparent
                      : BlackBullColors.white),
            ),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: BlackBullColors.white,
                ),
              )
            : icon != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (isPrefixIcon) icon!,
                        StandardText.button(
                          text.toUpperCase(),
                          color: isEnabled
                              ? (textColor ?? BlackBullColors.white)
                              : BlackBullColors.charcoal,
                          align: textAlign,
                          fontSize: textSize,
                          fontWeight: fontWeight,
                          letterSpacing: letterSpacing,
                          overflow: TextOverflow.ellipsis,
                        ),
                        5.horizontalGap,
                        if (!isPrefixIcon) icon!,
                      ],
                    ),
                  )
                : StandardText.button(
                    text.toUpperCase(),
                    color: (isEnabled
                        ? enableColor ?? BlackBullColors.white
                        : textColor ?? BlackBullColors.white),
                    align: textAlign,
                    fontSize: textSize,
                    fontWeight: fontWeight,
                    letterSpacing: letterSpacing,
                  ),
      ),
    );
  }
}
