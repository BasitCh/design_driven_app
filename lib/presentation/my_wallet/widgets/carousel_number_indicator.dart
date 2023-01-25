import 'package:black_bull_markets/application/my_wallet/my_wallet_cubit/carousel_cubit.dart';
import 'package:black_bull_markets/domain/my_wallet/my_wallet.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/carousel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletCardNumberIndicator extends StatelessWidget {
  const WalletCardNumberIndicator({
    Key? key,
    required List<MyWallet> widgets,
  })  : _widgets = widgets,
        super(key: key);

  final List<MyWallet> _widgets;

  @override
  Widget build(BuildContext context) {
    context.read<CarouselCubit>().resetCardNumber();
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: BlocBuilder<CarouselCubit, int>(
        builder: (context, state) {
          // state=0;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Material(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: BlackBullColors.black,
                    ),
                  ),
                  child: CarouselButton(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 14,
                    ),
                    onTap: () {
                      context
                          .read<CarouselCubit>()
                          .previousCard(state, itemCount: _widgets.length);
                    },
                  ),
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
                    return CarouselButton(
                      onTap: () {
                        context.read<CarouselCubit>().getToSelectedCard(index);
                      },
                      title: '${index + 1}',
                      isSelected: state == index,
                    );
                  },
                ),
              ),
              Flexible(
                child: Material(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: BlackBullColors.black,
                    ),
                  ),
                  child: CarouselButton(
                    onTap: () {
                      context
                          .read<CarouselCubit>()
                          .nextCard(state, itemCount: _widgets.length);
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
