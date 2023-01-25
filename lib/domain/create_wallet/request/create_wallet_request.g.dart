// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateWalletRequest _$CreateWalletRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CreateWalletRequest',
      json,
      ($checkedConvert) {
        final val = CreateWalletRequest(
          userId: $checkedConvert('userId', (v) => v as String?),
          nickName: $checkedConvert('nickName', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$CreateWalletRequestToJson(
  CreateWalletRequest instance,
) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickName': instance.nickName,
    };
