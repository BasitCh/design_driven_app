// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAccountResponse _$MyAccountResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MyAccountResponse',
      json,
      ($checkedConvert) {
        final val = MyAccountResponse(
          myAccounts: $checkedConvert(
            'myAccounts',
            (v) => (v as List<dynamic>?)
                ?.map((e) => MyAccount.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
        );
        return val;
      },
    );

Map<String, dynamic> _$MyAccountResponseToJson(MyAccountResponse instance) =>
    <String, dynamic>{
      'myAccounts': instance.myAccounts,
    };
