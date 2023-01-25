// ignore_for_file: must_be_immutable, always_specify_types

import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TradingPreferenceItem extends StatelessWidget {
  const TradingPreferenceItem({
    super.key,
    required this.title,
    required this.values,
  });

  final String title;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: title.isNotEmpty?20:0, horizontal: 5),
      decoration: title.isNotEmpty?BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: BlackBullColors.gradient,
      ):null,
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal: title.isNotEmpty?10:0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title.isNotEmpty?10.verticalGap:0.verticalGap,
            Visibility(
              visible: title.isNotEmpty,
              child: StandardText.headline4(
                context,
                title,
                fontSize: 22,
                align: TextAlign.start,
                fontWeight: FontWeight.w800,
              ),
            ),
            title.isNotEmpty?25.verticalGap:0.verticalGap,
            SizedBox(
              height: 35,
              child: ListView.builder(
                itemCount: values.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: const <double>[1, 1, 1, 1],
                      radius: const Radius.circular(12),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              transform: Matrix4.translationValues(-1, 0, 0),
                              child: SvgPicture.asset(
                                BlackBullIcons.unSelectedRadioBtn,
                              ),
                            ),
                            5.horizontalGap,
                            StandardText.body2(context, values[index]),
                            5.horizontalGap,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            35.verticalGap,
          ],
        ),
      ),
    );
  }
}
