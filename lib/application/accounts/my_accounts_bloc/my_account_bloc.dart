import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/my_account/my_account_response/my_account_response.dart';
import 'package:black_bull_markets/infrastructure/my_account/myaccount_repository.dart';
import 'package:black_bull_markets/presentation/accounts/widgets/myaccount_card_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_account_event.dart';
part 'my_account_state.dart';

class MyAccountBloc extends Bloc<MyAccountEvent, MyAccountState> {
  final MyAccountRepository myAccountRepository;
  MyAccountBloc({
    required this.myAccountRepository,
  }) : super(MyAccountStateInitial()) {
    on<FetchMyAccountItems>(_onFetchMyWalletItems);
  }

  static PageController pageController = PageController(initialPage: 0);

  _onFetchMyWalletItems(
    FetchMyAccountItems event,
    Emitter<MyAccountState> emit,
  ) async {
    emit(MyAccountStateLoading());
    final response = await myAccountRepository.getMyAccounts();
    response.fold(
      (FailureEntity failureEntity) => emit(
        MyAccountStateError(
          message: failureEntity.toString(),
        ),
      ),
      (MyAccountResponse myAccountResponse) {
        List<MyAccountCardItem> sliderWidgets = myAccountResponse.myAccounts
                ?.map(
                  (item) => MyAccountCardItem(
                    myAccount: item,
                  ),
                )
                .toList() ??
            [];
        emit(
          MyAccountStateLoaded(
            myAccountResponse: myAccountResponse,
            sliderWidgets: sliderWidgets,
          ),
        );
      },
    );
  }
}
