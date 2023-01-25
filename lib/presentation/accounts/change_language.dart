import 'package:black_bull_markets/application/accounts/account_cubit/search_filter_cubit.dart';
import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/core/language_modle.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/icon_text.dart';
import 'package:black_bull_markets/shared/widgets/search_box.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  late List<LanguageModel> languages;
  late List<LanguageModel> languagesOrg;
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    languages = <LanguageModel>[];
    languagesOrg = <LanguageModel>[];
    resetLanguages();
    super.initState();
  }

  Future<void> resetLanguages() async {
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icUkFlag,
        name: 'changeLanguage.languageList.english'.tr(),
        code: 'en',
      ),
    );
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icArabicFlag,
        name: 'changeLanguage.languageList.arabic'.tr(),
        code: 'ar',
      ),
    );
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icGermanFlag,
        name: 'changeLanguage.languageList.german'.tr(),
      ),
    );
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icSpanishFlag,
        name: 'changeLanguage.languageList.spanish'.tr(),
      ),
    );
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icFrenchFlag,
        name: 'changeLanguage.languageList.french'.tr(),
      ),
    );
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icItalianFlag,
        name: 'changeLanguage.languageList.italian'.tr(),
      ),
    );
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icJapanFlag,
        name: 'changeLanguage.languageList.japanese'.tr(),
      ),
    );
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icKoreaFlag,
        name: 'changeLanguage.languageList.korean'.tr(),
      ),
    );
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icPortualFlag,
        name: 'changeLanguage.languageList.portuguese'.tr(),
      ),
    );
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icThaiFlag,
        name: 'changeLanguage.languageList.thai'.tr(),
      ),
    );
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icChinaFlag,
        name: 'changeLanguage.languageList.chinese'.tr(),
      ),
    );
    languages.add(
      LanguageModel(
        flagPath: BlackBullIcons.icVietnamFlag,
        name: 'changeLanguage.languageList.vietnamese'.tr(),
      ),
    );
    languagesOrg.addAll(languages);
  }

  void filterSearchResults(String query, BuildContext context) {
    List<LanguageModel> dummySearchList = <LanguageModel>[];
    dummySearchList.addAll(languages);
    if (query.isNotEmpty) {
      List<LanguageModel> dummyListData = <LanguageModel>[];
      for (LanguageModel item in dummySearchList) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      languagesOrg.clear();
      languagesOrg.addAll(dummyListData);
      context.read<SearchFilterCubit>().clearList();
      context.read<SearchFilterCubit>().refreshList();
      return;
    } else {
      languagesOrg.clear();
      languagesOrg.addAll(languages);
      context.read<SearchFilterCubit>().clearList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        getIt<NavigationService>()
            .navigateBack(beamerDelegate: globalBeamerDelegate);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: BlackBullColors.offWhite,
          body: Column(
            children: <Widget>[
              5.verticalGap,
              GestureDetector(
                onTap: () {
                  getIt<NavigationService>()
                      .navigateBack(beamerDelegate: globalBeamerDelegate);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(
                    BlackBullIcons.icCloseButton,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              IconText(
                iconPathSvg: BlackBullIcons.icLanguage,
                standardText: StandardText.headline1(
                  context,
                  'changeLanguage.changeLanguageText'.tr(),
                  color: BlackBullColors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 22.0,
                  align: TextAlign.left,
                ),
              ),
              40.verticalGap,
              SearchBox(
                controller: controller,
                onChangedValue: (String value) {
                  filterSearchResults(value, context);
                },
                appButton: AppButton(
                  text: 'Cancel',
                  color: BlackBullColors.transparent,
                  borderColor: BlackBullColors.transparent,
                  textColor: BlackBullColors.blueDark,
                  enableColor: BlackBullColors.blueDark,
                  textSize: 17.0,
                  fontWeight: FontWeight.w600,
                  width: 20,
                  height: 40,
                  onPressed: () {
                    controller.clear();
                    filterSearchResults(controller.text, context);
                  },
                ),
              ),
              36.verticalGap,
              const Divider(
                thickness: 2,
                color: BlackBullColors.black10,
              ),
              BlocBuilder<SearchFilterCubit, bool>(
                builder: (_, bool isRefresh) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: languagesOrg.length,
                      itemBuilder: (BuildContext context, int i) {
                        return GestureDetector(
                          onTap: () async {
                            if (languagesOrg[i].code != null &&
                                context.locale.toString() !=
                                    languagesOrg[i].code) {
                              await context
                                  .setLocale(Locale(languagesOrg[i].code!));
                              languages.clear();
                              languagesOrg.clear();
                              await resetLanguages();
                              setState(() {});
                            }
                          },
                          child: Column(
                            children: <Widget>[
                              25.verticalGap,
                              IconText(
                                iconPathSvg: languagesOrg[i].flagPath,
                                standardText: StandardText.headline1(
                                  context,
                                  languagesOrg[i].name.tr(),
                                  color: BlackBullColors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                  align: TextAlign.left,
                                ),
                              ),
                              10.verticalGap,
                              i == languagesOrg.length - 1
                                  ? Container()
                                  : const Divider(
                                      thickness: 1,
                                      color: BlackBullColors.black10,
                                      indent: 30.0,
                                    )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
