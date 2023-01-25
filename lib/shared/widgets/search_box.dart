// ignore_for_file: always_specify_types

import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/text_styles.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.appButton,
    required this.controller,
    required this.onChangedValue,
  }) : super(key: key);
  final TextEditingController? controller;
  final AppButton appButton;
  final ValueChanged<String> onChangedValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        28.horizontalGap,
        SizedBox(
          width: MediaQuery.of(context).size.width*.65,
          child: StandardTextField(
            controller: controller,
            key: const Key('changeLanguage_search'),
            borderColor: BlackBullColors.transparent,
            borderRadius: 7.0,
            hintStyle: BlackBullTextStyle.customStyle.copyWith(
              fontWeight: FontWeight.w600,
              color:BlackBullColors.searchTextColor,
            ),
            onChanged: (value){
              onChangedValue(value);
            },
            prefixWidget:
                Container(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(BlackBullIcons.icSearch,),),
            fillColor: BlackBullColors.searchBackColor,
            hintText: 'changeLanguage.search'.tr(),
          ),
        ),
        10.horizontalGap,
        Expanded(child: Container(
            margin: const EdgeInsets.only(right: 12.0),
            child: appButton,),),
      ],
    );
  }
}
