import 'package:black_bull_markets/domain/create_wallet/country_currency.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCubit extends Cubit<CountryCurrency?>{
  CountryCubit():super(null);

  onCountryPicked(CountryCurrency country){
    emit(country);
  }

  onTextFieldClicked(){
    // emit(state.);
  }

  onCloseBottomSheet(){
    emit(null);
  }

}
