// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internal_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InternalTransfer _$InternalTransferFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'InternalTransfer',
      json,
      ($checkedConvert) {
        final val = InternalTransfer(
          fromWalletName:
              $checkedConvert('fromWalletName', (v) => v as String?),
          fromAccountName:
              $checkedConvert('fromAccountName', (v) => v as String?),
          toWalletName: $checkedConvert('toWalletName', (v) => v as String?),
          toAccountName: $checkedConvert('toAccountName', (v) => v as String?),
          amount: $checkedConvert('amount', (v) => v as int?),
          currency: $checkedConvert('currency', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$InternalTransferToJson(InternalTransfer instance) =>
    <String, dynamic>{
      'fromWalletName': instance.fromWalletName,
      'fromAccountName': instance.fromAccountName,
      'toWalletName': instance.toWalletName,
      'toAccountName': instance.toAccountName,
      'amount': instance.amount,
      'currency': instance.currency,
    };
