import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/onboarding/widgets/page_indicator.dart';
import 'package:black_bull_markets/presentation/onboarding/widgets/quiz_info_sheets.dart';
import 'package:black_bull_markets/presentation/onboarding/widgets/quiz_item.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final PageController pageController = PageController(initialPage: 0);
  int page = 0;

  List<Question> questions = [
    Question(
      title: 'What asset class would define USDJPY?',
      answers: [
        Answer(
          title: 'Stock',
          isSelected: false,
        ),
        Answer(
          title: 'CFD Index',
          isSelected: false,
        ),
        Answer(
          title: 'Forex Pair',
          isSelected: false,
        ),
        Answer(
          title: 'An energy',
          isSelected: false,
        ),
      ],
    ),
    Question(
      title: 'What causes currency prices to change?',
      answers: [
        Answer(
          title: 'Economic factors',
          isSelected: false,
        ),
        Answer(
          title: 'Political factors',
          isSelected: false,
        ),
        Answer(
          title: 'Central bank intervention',
          isSelected: false,
        ),
        Answer(
          title: 'All of above',
          isSelected: false,
        ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: BlackBullColors.primary,
      bullPath: BlackBullImages.bullWhiteFull,
      appBar: AppBar(
        backgroundColor: BlackBullColors.primary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: BlackBullColors.black,
          ),
          onPressed: () => getIt<NavigationService>()
              .navigateBack(beamerDelegate: globalBeamerDelegate),
        ),
        title: StandardText.headline4(
          context,
          'FOREX & CFDS - Application Step 4',
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            15.verticalGap,
            StandardText.headline4(
              context,
              'FOREX & CFDS',
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
            10.verticalGap,
            NumberStepper(
              totalSteps: 4,
              width: MediaQuery.of(context).size.width,
              curStep: 4,
              stepCompleteColor: BlackBullColors.tertiary,
              currentStepColor: BlackBullColors.accent,
              inactiveColor: BlackBullColors.transparent,
              lineWidth: 3.5,
            ),
            35.verticalGap,
            StandardText.headline4(
              context,
              'Suitability Quiz',
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            5.verticalGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  BlackBullIcons.blueClockIcon,
                  fit: BoxFit.contain,
                ),
                5.horizontalGap,
                StandardText.headline4(
                  context,
                  '05:30',
                  fontSize: 18,
                  color: BlackBullColors.accent,
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
            30.verticalGap,
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.33,
                maxHeight: MediaQuery.of(context).size.height * 0.42,
              ),
              child: PageView.builder(
                controller: pageController,
                pageSnapping: false,
                reverse: true,
                itemCount: questions.length,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: ((value) {
                  setState(() {
                    page = value;
                  });
                }),
                itemBuilder: ((context, index) {
                  return QuizItem(
                    question: questions[index],
                  );
                }),
              ),
            ),
            20.verticalGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            30.verticalGap,
            Row(
              children: <Widget>[
                Expanded(
                  child: AppButton(
                    text: 'Previous',
                    radius: 5,
                    textSize: 14,
                    onPressed: moveBack,
                    borderColor: BlackBullColors.darkGrey,
                    color: BlackBullColors.darkGrey,
                    textColor: BlackBullColors.white,
                  ),
                ),
                15.horizontalGap,
                Expanded(
                  child: AppButton(
                    text: 'Next ',
                    radius: 5,
                    textSize: 14,
                    onPressed: moveNext,
                    borderColor: BlackBullColors.tertiary,
                    color: BlackBullColors.tertiary,
                    textColor: BlackBullColors.white,
                  ),
                ),
              ],
            ),
            20.verticalGap,
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];

    for (int i = 0; i < questions.length; i++) {
      list.add(PageIndicator(isActive: i == page));
    }
    return list;
  }

  moveNext() {
    final index = pageController.page!.toInt();
    if (index + 1 == questions.length) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          QuizInfoSheets.quizSuccess(context);
        },
      );
    } else if (index < questions.length) {
      pageController.animateToPage(
        pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  moveBack() {
    final index = pageController.page!.toInt();
    if (index > 0) {
      pageController.animateToPage(
        pageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }
}

class Question {
  final String title;
  final List<Answer> answers;

  Question({required this.title, required this.answers});
}

class Answer {
  final String title;
  final bool isSelected;

  Answer({required this.title, required this.isSelected});
}
