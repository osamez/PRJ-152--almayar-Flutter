import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'price_calculator_state.dart';

class PriceCalculatorCubit extends Cubit<PriceCalculatorState> {
  PriceCalculatorCubit() : super(PriceCalculatorInitial());
}
