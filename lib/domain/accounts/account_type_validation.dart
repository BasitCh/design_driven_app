import 'package:formz/formz.dart';

enum AccountTypeValidationError {
  empty(''),
  invalid('');

  final String message;
  const AccountTypeValidationError(this.message);
}

class AccountType extends FormzInput<String, AccountTypeValidationError> {
  const AccountType.pure() : super.pure('');
  const AccountType.dirty([String value = '']) : super.dirty(value);

  @override
  AccountTypeValidationError? validator(String? value) {
    return value!.isNotEmpty
        ? null
        : AccountTypeValidationError.invalid;
  }
}
