// ignore_for_file: always_specify_types
import 'package:flutter_bloc/flutter_bloc.dart';
class SearchFilterCubit extends Cubit<bool> {
  SearchFilterCubit() : super(false);
  void refreshList() => emit(true);
  void clearList() => emit(false);
}
