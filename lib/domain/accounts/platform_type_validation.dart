import 'package:formz/formz.dart';

enum PlatFormTypeValidationError {
  empty(''),
  invalid('');

  final String message;
  const PlatFormTypeValidationError(this.message);
}

class PlatFormType extends FormzInput<String, PlatFormTypeValidationError> {
  const PlatFormType.pure() : super.pure('');
  const PlatFormType.dirty([String value = '']) : super.dirty(value);

  @override
  PlatFormTypeValidationError? validator(String? value) {
    return value!.isNotEmpty
        ? null
        : PlatFormTypeValidationError.invalid;
  }
}
