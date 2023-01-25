// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_funds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFunds _$AddFundsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'AddFunds',
      json,
      ($checkedConvert) {
        final val = AddFunds(
          amount: $checkedConvert('amount', (v) => v as String?),
          paymentCard: $checkedConvert(
            'paymentCard',
            (v) => v == null
                ? null
                : PaymentCard.fromJson(v as Map<String, dynamic>),
          ),
          myWallet: $checkedConvert(
            'myWallet',
            (v) =>
                v == null ? null : MyWallet.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
    );

Map<String, dynamic> _$AddFundsToJson(AddFunds instance) => <String, dynamic>{
      'amount': instance.amount,
      'paymentCard': instance.paymentCard,
      'myWallet': instance.myWallet,
    };
