import 'package:country_calling_code_picker/country.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCountryCubit extends Cubit<Country> {
  SelectCountryCubit() : super(const Country('New Zeland', '', '+64', '64'));

  void selectCountry({required Country country}) => emit(country);
}
