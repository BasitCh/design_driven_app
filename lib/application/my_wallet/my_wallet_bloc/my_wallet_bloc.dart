import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/my_wallet/response/my_wallet_response.dart';
import 'package:black_bull_markets/infrastructure/my_wallet/mywallet_repository.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_card_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_wallet_event.dart';
part 'my_wallet_state.dart';

class MyWalletBloc extends Bloc<MyWalletEvent, MyWalletState> {
  final MyWalletRepository myWalletRepository;
  MyWalletBloc({
    required this.myWalletRepository,
  }) : super(MyWalletStateInitial()) {
    on<FetchMyWalletItems>(_onFetchMyWalletItems);
  }

  static PageController pageController = PageController(initialPage: 0);

  _onFetchMyWalletItems(
    FetchMyWalletItems event,
    Emitter<MyWalletState> emit,
  ) async {
    emit(MyWalletStateLoading());
    final response = await myWalletRepository.getMyWallets();
    response.fold(
      (FailureEntity failureEntity) => emit(
        MyWalletStateError(
          message: failureEntity.toString(),
        ),
      ),
      (MyWalletResponse myWalletResponse) {
        List<MyWalletCardItem> sliderWidgets = myWalletResponse.myWallets
                ?.map(
                  (item) => MyWalletCardItem(
                    myWallet: item,
                    isAddFundsPage: event.isAddFundsPage,
                  ),
                )
                .toList() ??
            [];
        emit(
          MyWalletStateLoaded(
            myWalletResponse: myWalletResponse,
            sliderWidgets: sliderWidgets,
          ),
        );
      },
    );
  }
}
