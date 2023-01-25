import 'package:black_bull_markets/domain/my_account/my_account.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/carousel_button.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WalletAccountNumberIndicator extends StatelessWidget {
  const WalletAccountNumberIndicator({
    Key? key,
    required ValueNotifier<int> selectedIndex,
    required List<MyAccount> widgets,
    required carouselController,
  })  : _selectedIndex = selectedIndex,
        _widgets = widgets,
        _carouselController = carouselController,
        super(key: key);

  final ValueNotifier<int> _selectedIndex;
  final List<MyAccount> _widgets;
  final CarouselController _carouselController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: CarouselButton(
              child: SvgPicture.asset(BlackBullIcons.icCarouselBack,fit: BoxFit.contain,),
              onTap: () {
                if (_selectedIndex.value > 0 &&
                    _selectedIndex.value < _widgets.length) {
                  _selectedIndex.value--;
                  _carouselController.jumpToPage(_selectedIndex.value);
                  // _pageController.jumpToPage(_selectedIndex.value);
                }
                // _controller.previous(animation: true);
              },
            ),
          ),
          Flexible(
            flex: 8,
            // fit: FlexFit.tight,
            child: ListView.builder(
              itemCount: _widgets.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // var selectedIndex = 0;
                return ValueListenableBuilder(
                  valueListenable: _selectedIndex,
                  builder: (context, newIndex, child) {
                    return CarouselButton(
                      onTap: () {
                        _selectedIndex.value = index;
                        _carouselController.animateToPage(_selectedIndex.value);
                      },
                      unSelectedColor: BlackBullColors.gray,
                      title: '${index + 1}',
                      isSelected: newIndex == index,
                    );
                  },
                );
              },
            ),
          ),
          Flexible(
            child: CarouselButton(
              onTap: () {
                if (_selectedIndex.value >= 0 &&
                    _selectedIndex.value < _widgets.length - 1) {
                  _selectedIndex.value++;
                  _carouselController.jumpToPage(_selectedIndex.value);
                }
                // _pageController.jumpToPage(_selectedIndex.value);
              },
              unSelectedColor: BlackBullColors.gray,
              child: SvgPicture.asset(BlackBullIcons.icCarouselForward,fit: BoxFit.contain,),
            ),
          ),
        ],
      ),
    );
  }
}
