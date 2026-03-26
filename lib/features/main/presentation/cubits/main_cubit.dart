import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<int> {
  MainCubit() : super(0);

  /// Registered by HomeViewBody so back-press logic can inspect / reset scroll.
  ScrollController? homeScrollController;

  bool get isHomeScrolled =>
      homeScrollController != null &&
      homeScrollController!.hasClients &&
      homeScrollController!.offset > 0;

  void scrollHomeToTop() {
    homeScrollController?.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void changeIndex(int index) {
    emit(index);
  }
}
