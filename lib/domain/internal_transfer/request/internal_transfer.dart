import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'internal_transfer.g.dart';

@JsonSerializable(checked: true, createToJson: true)
class InternalTransfer extends Equatable {
  final String? fromWalletName;
  final String? fromAccountName;
  final String? toWalletName;
  final String? toAccountName;
  final int? amount;
  final String? currency;

  const InternalTransfer({
    this.fromWalletName,
    this.fromAccountName,
    this.toWalletName,
    this.toAccountName,
    this.amount,
    this.currency,
  });

  factory InternalTransfer.empty() => const InternalTransfer(
        fromAccountName: '',
        fromWalletName: '',
        toAccountName: '',
        currency: '',
        amount: 0,
        toWalletName: '',
      );

  InternalTransfer copyWith({
    String? fromWalletName,
    String? fromAccountName,
    String? toWalletName,
    String? toAccountName,
    int? amount,
    String? currency,
  }) =>
      InternalTransfer(
        fromAccountName: fromWalletName ?? this.fromWalletName,
        fromWalletName: fromAccountName ?? this.fromAccountName,
        toAccountName: toWalletName ?? this.toWalletName,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        toWalletName: currency ?? this.currency,
      );

  factory InternalTransfer.fromJson(Map<String, dynamic> json) =>
      _$InternalTransferFromJson(json);

  Map<String, dynamic> toJson() => _$InternalTransferToJson(this);

  @override
  List<Object?> get props => [
        fromWalletName,
        fromAccountName,
        toWalletName,
        toAccountName,
        amount,
        currency,
      ];
}
