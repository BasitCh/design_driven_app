import 'package:black_bull_markets/application/add_funds/add_funds_cubit/add_funds_card_cubit.dart';
import 'package:black_bull_markets/application/my_wallet/my_wallet_cubit/carousel_cubit.dart';
import 'package:black_bull_markets/domain/my_wallet/my_wallet.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/carousel_number_indicator.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_card_item.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselWalletCardsWithNumber extends StatelessWidget {
  const CarouselWalletCardsWithNumber({
    Key? key,
    required List<MyWalletCardItem> widgets,
    required this.myWallet,
    this.isAddFundsPage=false,
    // this.onItemChanged,
  })  : _widgets = widgets,
        super(key: key);

  final List<MyWalletCardItem> _widgets;
  // final Function(int)? onItemChanged;
  final List<MyWallet> myWallet;
  final bool isAddFundsPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              padEnds: true,
              //height: 360,
              onPageChanged: (int index, _) {
                context.read<CarouselCubit>().onCardChanged(index);
                if(isAddFundsPage){
                  context
                      .read<AddFundsCardCubit>()
                      .onWalletSelected(myWallet: myWallet[index]);
                }
              },
              autoPlay: false,
              initialPage: 0,
              viewportFraction: 0.6,
              aspectRatio: 1.0,
              pageSnapping: false,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
            items: _widgets,
          ),
        ),
        32.verticalGap,
        WalletCardNumberIndicator(
          widgets: myWallet,
        ),
        24.verticalGap,
      ],
    );
  }
}
