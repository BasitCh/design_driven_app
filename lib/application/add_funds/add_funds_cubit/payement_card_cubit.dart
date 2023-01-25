import 'package:black_bull_markets/domain/add_funds/payment_card.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCardCubit extends Cubit<PaymentCard>{
  PaymentCardCubit():super(
    PaymentCard.empty(),
  );

  List<PaymentCard> paymentCardList = <PaymentCard>[
    PaymentCard(
      name: 'add_funds.credit_debit'.tr(),
      description: 'add_funds.credit_detail'.tr(),
      imageUrl: BlackBullImages.cardVisa,
      availabilityTime: 'add_funds.card_availability'.tr(),
      fee: 'add_funds.fee'.tr(),
    ),
    PaymentCard(
      name: 'add_funds.astropay'.tr(),
      description: 'add_funds.astro_detail'.tr(),
      imageUrl: BlackBullImages.cardAstropay,
      availabilityTime: 'add_funds.other_availability'.tr(),
      fee: 'add_funds.fee'.tr(),
    ),
    PaymentCard(
      name: 'add_funds.crypto'.tr(),
      description: 'add_funds.crypto_detail'.tr(),
      imageUrl: BlackBullImages.cardCrypto,
      availabilityTime: 'add_funds.other_availability'.tr(),
      fee: 'add_funds.fee'.tr(),
    ),
  ];

  onCardSelected(PaymentCard paymentCard){
    emit(paymentCard);
  }
}
