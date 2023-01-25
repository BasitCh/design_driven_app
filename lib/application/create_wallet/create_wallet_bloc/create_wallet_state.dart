part of 'create_wallet_bloc.dart';

abstract class CreateWalletState extends Equatable {}

class CreateWalletStateInitial extends CreateWalletState {
  @override
  List<Object?> get props => [];
}

class CreateWalletStateUploading extends CreateWalletState {
  CreateWalletStateUploading();

  @override
  List<Object?> get props => [];
}

class CreateWalletStateUploaded extends CreateWalletState {
  CreateWalletStateUploaded({
    required this.createWalletResponse,
});
  final CreateWalletResponse createWalletResponse;

  @override
  List<Object?> get props => [

  ];
}

class CreateWalletStateError extends CreateWalletState {
  final String message;
  CreateWalletStateError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
