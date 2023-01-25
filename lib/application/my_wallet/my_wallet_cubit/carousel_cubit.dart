import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final CarouselController carouselController = CarouselController();

class CarouselCubit extends Cubit<int> {
  CarouselCubit() : super(0);

  nextCard(int index, {required int itemCount}) {
    if (index < itemCount - 1) {
      index++;
      carouselController.animateToPage(index);
    }
    emit(index);
  }

  previousCard(int index, {required int itemCount}) {
    if (index > 0) {
      index--;
      carouselController.animateToPage(index);
    }
    emit(index);
  }

  getToSelectedCard(int index) {
    carouselController.jumpToPage(index);
    emit(index);
  }

  onCardChanged(int index) {
    emit(index);
  }

  resetCardNumber(){
    emit(0);
  }
}
