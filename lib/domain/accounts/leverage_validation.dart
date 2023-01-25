import 'package:formz/formz.dart';

enum LeverageValidationError {
  empty(''),
  invalid('');

  final String message;
  const LeverageValidationError(this.message);
}

class Leverage extends FormzInput<String, LeverageValidationError> {
  const Leverage.pure() : super.pure('');
  const Leverage.dirty([String value = '']) : super.dirty(value);

  @override
  LeverageValidationError? validator(String? value) {
    return value!.isNotEmpty
        ? null
        : LeverageValidationError.invalid;
  }
}
