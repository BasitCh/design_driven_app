import 'package:black_bull_markets/domain/my_wallet/my_wallet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFundsCardCubit extends Cubit<MyWallet>{
  AddFundsCardCubit():super(MyWallet.empty());

  onWalletSelected({required MyWallet myWallet}){
    emit(myWallet);
  }
}
