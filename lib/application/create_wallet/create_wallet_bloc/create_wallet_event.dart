part of 'create_wallet_bloc.dart';

abstract class CreateWalletEvent extends Equatable{}

class UploadNewWallet extends CreateWalletEvent{
  UploadNewWallet({required this.createWalletRequest,});
  final CreateWalletRequest createWalletRequest;
  @override
  List<Object?> get props => [createWalletRequest,];
}
