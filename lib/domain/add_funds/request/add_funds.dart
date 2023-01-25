import 'package:black_bull_markets/domain/add_funds/payment_card.dart';
import 'package:black_bull_markets/domain/my_wallet/my_wallet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_funds.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class AddFunds {
  final String? amount;
  final PaymentCard? paymentCard;
  final MyWallet? myWallet;

  AddFunds({
    this.amount,
    this.paymentCard,
    this.myWallet,
});

  factory AddFunds.empty()=>AddFunds(
    amount: '',
    myWallet: MyWallet.empty(),
    paymentCard: PaymentCard.empty(),
  );

  factory AddFunds.fromJson(Map<String, dynamic> json) =>
      _$AddFundsFromJson(json);

  Map<String, dynamic> toJson() => _$AddFundsToJson(this);
}
