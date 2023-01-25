import 'package:black_bull_markets/presentation/onboarding/quiz_page.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuizItem extends StatefulWidget {
  const QuizItem({super.key, required this.question});

  final Question question;

  @override
  State<QuizItem> createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: BlackBullColors.lightGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          15.verticalGap,
          StandardText.headline5(
            context,
            widget.question.title,
            align: TextAlign.left,
            maxLines: 3,
          ),
          5.verticalGap,
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.question.answers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(BlackBullIcons.unSelectedRadioBtn),
                    5.horizontalGap,
                    Flexible(
                      child: StandardText.body2(
                        context,
                        widget.question.answers[index].title,
                        fontSize: 14,
                        maxLines: 2,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
