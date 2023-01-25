import 'package:formz/formz.dart';

enum CurrencyValidationError {
  empty(''),
  invalid('');

  final String message;
  const CurrencyValidationError(this.message);
}

class Currency extends FormzInput<String, CurrencyValidationError> {
  const Currency.pure() : super.pure('');
  const Currency.dirty([String value = '']) : super.dirty(value);

  @override
  CurrencyValidationError? validator(String? value) {
    return value!.isNotEmpty
        ? null
        : CurrencyValidationError.invalid;
  }
}
