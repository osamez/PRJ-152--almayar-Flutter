part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final int currentStep;

  const RegisterState({this.currentStep = 1});

  static const int totalSteps = 3;

  bool get isLastStep => currentStep == totalSteps;

  RegisterState copyWith({int? currentStep}) {
    return RegisterState(currentStep: currentStep ?? this.currentStep);
  }

  @override
  List<Object> get props => [currentStep];
}
