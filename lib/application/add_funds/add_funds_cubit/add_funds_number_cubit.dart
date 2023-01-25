import 'package:flutter_bloc/flutter_bloc.dart';

class AddFundsNumberCubit extends Cubit<int>{
  AddFundsNumberCubit():super(1);

  onWalletSelected(){
    emit(2);
  }

  onNextPage(){
    if(state<4){
      emit(state+1);
    }
  }

  onPreviousPage(){
    if(state>1){
      emit(state-1);
    }
  }

}
