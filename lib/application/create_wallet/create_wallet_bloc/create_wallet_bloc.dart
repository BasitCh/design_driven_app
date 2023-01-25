
import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/create_wallet/request/create_wallet_request.dart';
import 'package:black_bull_markets/domain/create_wallet/response/create_wallet_response.dart';
import 'package:black_bull_markets/infrastructure/create_wallet/createwallet_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_wallet_event.dart';

part 'create_wallet_state.dart';

class CreateWalletBloc extends Bloc<CreateWalletEvent, CreateWalletState> {
  CreateWalletBloc({
    required this.createWalletRepository,
  }) : super(CreateWalletStateInitial()) {
    on<UploadNewWallet>(_onUploadNewWallet);
  }

  CreateWalletRepository createWalletRepository;

  _onUploadNewWallet(
      UploadNewWallet event, Emitter<CreateWalletState> emit,) async {
    emit(CreateWalletStateUploading());
    final response = await createWalletRepository.createNewWallet(
      createWalletRequest: event.createWalletRequest,
    );
    response.fold(
      (FailureEntity failureEntity) => emit(
        CreateWalletStateError(
          message: failureEntity.toString(),
        ),
      ),
      (CreateWalletResponse createWalletResponse) {
        emit(
          CreateWalletStateUploaded(createWalletResponse: createWalletResponse),
        );
      },
    );
  }
}
