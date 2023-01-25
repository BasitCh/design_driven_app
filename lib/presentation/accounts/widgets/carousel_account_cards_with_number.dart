import 'package:black_bull_markets/domain/my_account/my_account.dart';
import 'package:black_bull_markets/presentation/accounts/widgets/carousel_my_account_number_indicator.dart';
import 'package:black_bull_markets/presentation/accounts/widgets/myaccount_card_item.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class CarouselAccountsCardsWithNumber extends StatelessWidget {
  const CarouselAccountsCardsWithNumber({
    Key? key,
    required ValueNotifier<int> index,
    required List<MyAccountCardItem> widgets,
    required this.myAccount,
    required CarouselController carouselController,
    this.onItemChanged,
  })  : _index = index,
        _widgets = widgets,
        _carouselController = carouselController,
        super(key: key);
  final CarouselController _carouselController;
  final ValueNotifier<int> _index;
  final List<MyAccountCardItem> _widgets;
  final Function(int)? onItemChanged;
  final List<MyAccount> myAccount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child:
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              padEnds: true,
              //height: 360,
              autoPlay: false,
              initialPage: 0,
             onPageChanged: (index, reason) {
               _index.value = index;
               _carouselController.animateToPage(_index.value);
             },
              viewportFraction: 0.6,
              aspectRatio:1.0,
              pageSnapping: false,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
            items: _widgets,
          ),
          // Gallery3D(
          //   itemCount: _widgets.length,
          //   width: MediaQuery.of(context).size.width,
          //   currentIndex: _index.value,
          //   onItemChanged: onItemChanged,
          //   onClickItem: (index) {
          //     if (kDebugMode) {
          //       print('currentIndex:$index');
          //     }
          //   },
          //   widgets: _widgets,
          // ),
        ),
        32.verticalGap,
        WalletAccountNumberIndicator(
          selectedIndex: _index,
          widgets: myAccount,
          carouselController: _carouselController,
        ),
        24.verticalGap,
      ],
    );
  }
}
