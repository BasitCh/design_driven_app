// ignore_for_file: always_specify_types

import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';

class SwitchSelection extends StatelessWidget {
  const SwitchSelection({
    Key? key,
    required this.title,
    required this.boxShadowColor,
    required this.color,
    required this.isLeftBorder,
    this.textColor,
    this.indicationColor,
    this.fontWeight,
    this.fontSize,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Color boxShadowColor;
  final Color color;
  final VoidCallback? onTap;
  final Color? indicationColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool isLeftBorder;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isLeftBorder?4.0:0.0),
                bottomLeft: Radius.circular(isLeftBorder?4.0:0.0),
                topRight: Radius.circular(!isLeftBorder?4.0:0.0),
                bottomRight: Radius.circular(!isLeftBorder?4.0:0.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: const Offset(0, 0),
                  color: boxShadowColor,
                  spreadRadius: 0,
                  blurRadius: 1,
                ),
              ],
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 5.0,
                bottom: 5.0,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: indicationColor?? BlackBullColors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(' '),
                  ),
                  2.0.horizontalGap,
                  StandardText.headline1(
                    context,
                    title,
                    color:textColor??
                        BlackBullColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize??12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
