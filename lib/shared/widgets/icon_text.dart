// ignore_for_file: always_specify_types

import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.iconPathSvg,
    required this.standardText,
  }) : super(key: key);

  final String iconPathSvg;
  final StandardText standardText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        28.horizontalGap,
        SvgPicture.asset(
          iconPathSvg,
          fit: BoxFit.contain,
        ),
        5.horizontalGap,
        Expanded(child: standardText)
      ],
    );
  }
}
