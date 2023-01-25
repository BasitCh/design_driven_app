import 'dart:developer';
import 'dart:io';

import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/app_dropdown.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/bottom_sheets.dart';
import 'package:black_bull_markets/shared/widgets/number_stepper.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:black_bull_markets/shared/widgets/submitted_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class DocumentsVerificationPage extends StatefulWidget {
  const DocumentsVerificationPage({super.key});

  @override
  State<DocumentsVerificationPage> createState() =>
      _DocumentsVerificationPageState();
}

class _DocumentsVerificationPageState extends State<DocumentsVerificationPage> {
  final List<String> documentTypes = ['Bank Statement', 'Driving License'];
  final List<String> conditions = [
    'Should be different from other documents you have provided.',
    'Should be in color.',
    'Please attach the front and back of your ID as separate files.',
    'Name, date of birth, document expiry date and all other details should be clearly visible.',
    'Must be current and not expired.'
  ];
  final _picker = ImagePicker();
  String selectedDocType = '';
  File? file;

  @override
  void initState() {
    super.initState();
    selectedDocType = documentTypes[0];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BottomSheets.declarationAlert(context: context);
    });
  }

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
          'Verification',
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              15.verticalGap,
              StandardText.headline4(
                context,
                'Account Registration',
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
                'PHOTO ID VERIFICATION',
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              5.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: StandardText.body2(
                  context,
                  'Select a type of ID from the dropdown',
                  align: TextAlign.left,
                ),
              ),
              15.verticalGap,
              AppDropDown(
                values: documentTypes,
                selectedValue: selectedDocType,
                onChange: (String value) {
                  setState(() {
                    selectedDocType = value;
                  });
                },
              ),
              25.verticalGap,
              file != null
                  ? Stack(
                      children: [
                        Container(
                          height: 224,
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            color: BlackBullColors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 10.0,
                                offset: Offset(0.0, 0.9),
                              )
                            ],
                          ),
                          child: Image.file(
                            file!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: GestureDetector(
                            onTap: () async {
                              setState(() {
                                file = null;
                              });
                            },
                            child: Container(
                              transform: Matrix4.translationValues(0, -10, 0),
                              child: SvgPicture.asset(
                                BlackBullIcons.redCloseIcon,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : ListView.builder(
                      itemCount: conditions.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: StandardText.body2(
                            context,
                            conditions[index],
                            align: TextAlign.start,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }),
                    ),
              25.verticalGap,
              file != null
                  ? Column(
                      children: [
                        AppButton(
                          text: 'Change',
                          color: BlackBullColors.borderColor,
                          borderColor: BlackBullColors.borderColor,
                          radius: 8,
                          width: double.infinity,
                          onPressed: () async {
                            await _pickImage();
                          },
                        ),
                        5.verticalGap,
                      ],
                    )
                  : const SizedBox.shrink(),
              AppButton(
                text: 'Upload document',
                color: BlackBullColors.tertiary,
                borderColor: BlackBullColors.tertiary,
                radius: 8,
                width: double.infinity,
                onPressed: () async {
                  file != null
                      ? getIt<NavigationService>().navigateToNamed(
                          uri: NavigationService.submittedSuccessRouteURI,
                          beamerDelegate: globalBeamerDelegate,
                          data: SubmittedPageArgs(
                            continueText:
                                'buttons.go_accounts'.tr().toUpperCase(),
                            onContinue: () {
                              getIt<NavigationService>().navigateToNamed(
                                uri: NavigationService.accountRouteUri,
                                beamerDelegate: globalBeamerDelegate,
                              );
                            },
                          ),
                        )
                      : await _pickImage();
                },
              ),
              file == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        25.verticalGap,
                        StandardText.body2(
                          context,
                          'Max file size: 5MB',
                          align: TextAlign.center,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        StandardText.body2(
                          context,
                          'Allowed file formats:',
                          align: TextAlign.center,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        StandardText.body2(
                          context,
                          'PDF, DOCX, PNG, JPG, JPEG',
                          align: TextAlign.center,
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              30.verticalGap,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      setState(() {
        file = File(pickedFile!.path);
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
