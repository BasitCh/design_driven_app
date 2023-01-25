// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateWalletResponse _$CreateWalletResponseFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate(
      'CreateWalletResponse',
      json,
      ($checkedConvert) {
        final val = CreateWalletResponse(
          message: $checkedConvert('message', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$CreateWalletResponseToJson(
  CreateWalletResponse instance,
) =>
    <String, dynamic>{
      'message': instance.message,
    };
