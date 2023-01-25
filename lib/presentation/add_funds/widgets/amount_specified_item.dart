import 'package:black_bull_markets/application/add_funds/add_funds_bloc/add_funds_bloc.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/add_fund_radio_amount_index.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AmountSpecifiedItem extends StatefulWidget {
  const AmountSpecifiedItem({
    Key? key,
    required this.values,
  }) : super(key: key);

  final List<String> values;

  @override
  State<AmountSpecifiedItem> createState() => _AmountSpecifiedItemState();
}

class _AmountSpecifiedItemState extends State<AmountSpecifiedItem> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.values.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (kDebugMode) {
                  print(widget.values[index]);
                }
                AddFundsBloc.amountTextEditingController.text =
                    widget.values[index];
                context.read<AddFundRadioAmountIndex>().onAmountSelected(index);
              },
              child: BlocBuilder<AddFundRadioAmountIndex, int?>(
                builder: (context, selectedIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: selectedIndex == null?BlackBullColors.textColor: selectedIndex != index
                          ? BlackBullColors.textColor
                          : BlackBullColors.accent,
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
                                selectedIndex == null?BlackBullIcons.unSelectedRadioBtn:  selectedIndex != index
                                    ? BlackBullIcons.unSelectedRadioBtn
                                    : BlackBullIcons.selectedRadioBtn,
                              ),
                            ),
                            5.horizontalGap,
                            StandardText.body2(
                              context,
                              widget.values[index],
                              color: selectedIndex == null?
                              BlackBullColors.textColor:
                                      selectedIndex != index
                                  ? BlackBullColors.textColor
                                  : BlackBullColors.accent,
                            ),
                            5.horizontalGap,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
