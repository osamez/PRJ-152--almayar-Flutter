part of 'price_calculator_cubit.dart';

abstract class PriceCalculatorState extends Equatable {
  const PriceCalculatorState();

  @override
  List<Object> get props => [];
}

class PriceCalculatorInitial extends PriceCalculatorState {}
