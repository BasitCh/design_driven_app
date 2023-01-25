import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/wallet/wallet_item.dart';
import 'package:black_bull_markets/infrastructure/wallet/wallet_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository walletRepository;
  WalletBloc({
    required this.walletRepository,
  }) : super(WalletStateInitial()) {
    on<FetchWalletItems>(_onFetchWalletItems);
    on<NavigateToNext>(_onNavigateToNext);
  }

  List<WalletItem> walletItems = [];

  _onFetchWalletItems(FetchWalletItems event, Emitter<WalletState> emit) async {
    walletItems = [];
    emit(WalletStateLoading());
    final Either<FailureEntity, List<WalletItem>> response =
        await walletRepository.getWalletList();
    response.fold(
      (FailureEntity failure) => emit(
        WalletStateError(
          message: failure.toString(),
        ),
      ),
      (List<WalletItem> responseWalletItems) {
        walletItems = responseWalletItems;
        emit(
          WalletStateLoaded(
            walletItems: responseWalletItems,
            isNavigated: false,
          ),
        );
      },
    );
  }

  _onNavigateToNext(NavigateToNext event, Emitter<WalletState> emit) {
    emit(WalletStateInitial());
    emit(
      WalletStateLoaded(
        walletItems: walletItems,
        isNavigated: true,
        walletItem: event.walletItem,
      ),
    );
  }
}
