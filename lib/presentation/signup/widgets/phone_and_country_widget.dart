// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:black_bull_markets/application/singup/cubits/select_country_cubit.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_button_widget.dart';
import 'package:black_bull_markets/shared/widgets/app_dropdown.dart';
import 'package:black_bull_markets/shared/widgets/standard_textfield.dart';
import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAndCountryWidget extends StatefulWidget {
  const PhoneAndCountryWidget(
      {super.key, required this.formKey, required this.onNextPress});

  final Function() onNextPress;
  final GlobalKey<FormState> formKey;

  @override
  State<PhoneAndCountryWidget> createState() => _PhoneAndCountryWidgetState();
}

class _PhoneAndCountryWidgetState extends State<PhoneAndCountryWidget> {
  List<Country> countries = [];

  @override
  void initState() {
    initCountry();
    super.initState();
  }

  void initCountry() async {
    countries = await getCountries(context);
    final Country country = countries
        .where((Country country) => country.callingCode == '+64')
        .first;
    context.read<SelectCountryCubit>().selectCountry(country: country);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: BlocBuilder<SelectCountryCubit, Country>(
        builder: (_, Country country) {
          return Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () => _onPressedShowBottomSheet(context),
                    child: Container(
                      width: 60,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: BlackBullColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: country == null
                          ? Container()
                          : Row(
                              children: <Widget>[
                                Expanded(
                                  child: Image.asset(
                                    country.flag,
                                    package: countryCodePackageName,
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: BlackBullColors.black,
                                  size: 14,
                                )
                              ],
                            ),
                    ),
                  ),
                  5.horizontalGap,
                  Expanded(
                    child: StandardTextField(
                      hintText: '+852 23937847',
                      fillColor: BlackBullColors.white,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter phone';
                        } else if (value.length < 8) {
                          return 'Phone number must be of 8 numbers';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              8.verticalGap,
              AppDropDown(
                hintText: 'Residence Country',
                values: countries.map((e) => e.name).toList(),
                selectedValue: country.name,
                onChange: (value) {},
              ),
              8.verticalGap,
              StandardTextField(
                hintText: 'Country',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter country';
                  }
                  return null;
                },
              ),
              20.verticalGap,
              AppButton(
                text: 'Next',
                width: 100,
                height: 30,
                radius: 5,
                textSize: 14,
                onPressed: widget.onNextPress,
                color: BlackBullColors.black,
                textColor: BlackBullColors.white,
              ),
              20.verticalGap,
            ],
          );
        },
      ),
    );
  }

  void _onPressedShowBottomSheet(BuildContext context) async {
    final Country? country = await showCountryPickerSheet(
      context,
      cancelWidget: Container(
        margin: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.cancel),
        ),
      ),
    );
    if (country != null) {
      context.read<SelectCountryCubit>().selectCountry(country: country);
    }
  }
}
