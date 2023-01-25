// ignore_for_file: unused_local_variable

import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/dotted_line.dart';
import 'package:flutter/material.dart';

class NumberStepper extends StatelessWidget {
  final double width;
  final int totalSteps;
  final int curStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;
  final bool? isLast;
  final Color? dashColor;

  const NumberStepper({
    Key? key,
    required this.width,
    required this.curStep,
    required this.stepCompleteColor,
    required this.totalSteps,
    required this.inactiveColor,
    required this.currentStepColor,
    required this.lineWidth,
    this.isLast = false,
    this.dashColor,
  })  : assert(curStep > 0 == true && curStep <= totalSteps + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 24.0,
        right: 24.0,
      ),
      width: width,
      child: Row(
        children: _steps(),
      ),
    );
  }

  getCircleColor(int i) {
    Color color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (isLast! && i + 1 == curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep) {
      color = currentStepColor;
    } else {
      color = Colors.white;
    }
    return color;
  }

  getBorderColor(int i) {
    Color color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep) {
      color = currentStepColor;
    } else {
      color = BlackBullColors.black;
    }

    return color;
  }

  getLineColor(int i) {
    Color? color =
        curStep > i + 1 ? Colors.blue.withOpacity(0.4) : Colors.grey[200];
    return color;
  }

  List<Widget> _steps() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      //colors according to state

      Color circleColor = getCircleColor(i);
      Color borderColor = getBorderColor(i);
      Color lineColor = getLineColor(i);

      // step circles
      list.add(
        Container(
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            border: Border.all(
              color: borderColor,
              width: 2.0,
            ),
          ),
          child: getInnerElementOfStepper(i),
        ),
      );

      //line between step circles
      if (i != totalSteps - 1) {
        list.add(
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 14,right: 14),
              child: DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 2.0,
                dashColor: dashColor??Colors.black,
                dashRadius: 0.0,
                dashGapLength: 1.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            ),
          ),
        );
      }
    }

    return list;
  }

  Widget getInnerElementOfStepper(int index) {
    if (index + 1 < curStep) {
      // return const Icon(
      //   Icons.check,
      //   color: Colors.white,
      //   size: 16.0,
      // );
      return Center(
        child: Text(
          '${index + 1}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'mont',
          ),
        ),
      );
    } else if (isLast! && index + 1 == curStep) {
      return const Center(
        child: Icon(
          Icons.check,
          color: BlackBullColors.white,
          size: 15,
        ),
      );
    } else if (index + 1 == curStep) {
      return Center(
        child: Text(
          '$curStep',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'mont',
          ),
        ),
      );
    } else {
      return Center(
        child: Text(
          '${index + 1}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'mont',
          ),
        ),
      );
    }
  }
}
