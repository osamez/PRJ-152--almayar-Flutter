part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final int currentStep;
  final File? pickedImage;

  const RegisterState({this.currentStep = 1, this.pickedImage});

  static const int totalSteps = 3;

  bool get isLastStep => currentStep == totalSteps;

  static const _sentinel = Object();

  RegisterState copyWith({int? currentStep, Object? pickedImage = _sentinel}) {
    return RegisterState(
      currentStep: currentStep ?? this.currentStep,
      pickedImage: pickedImage == _sentinel
          ? this.pickedImage
          : pickedImage as File?,
    );
  }

  @override
  List<Object?> get props => [currentStep, pickedImage];
}
