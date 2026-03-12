part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final int currentStep;
  final File? pickedImage;
  final String fullName;
  final String phoneNumber;
  final String country;
  final String city;
  final String region;
  final String preferredBranch;
  final String email;
  final String whatsappNumber;
  final String password;
  final String confirmPassword;

  const RegisterState({
    this.currentStep = 1,
    this.pickedImage,
    this.fullName = '',
    this.phoneNumber = '',
    this.country = '',
    this.city = '',
    this.region = '',
    this.preferredBranch = '',
    this.email = '',
    this.whatsappNumber = '',
    this.password = '',
    this.confirmPassword = '',
  });

  static const int totalSteps = 3;

  bool get isLastStep => currentStep == totalSteps;

  static const _sentinel = Object();

  RegisterState copyWith({
    int? currentStep,
    Object? pickedImage = _sentinel,
    String? fullName,
    String? phoneNumber,
    String? country,
    String? city,
    String? region,
    String? preferredBranch,
    String? email,
    String? whatsappNumber,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterState(
      currentStep: currentStep ?? this.currentStep,
      pickedImage: pickedImage == _sentinel ? this.pickedImage : pickedImage as File?,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      country: country ?? this.country,
      city: city ?? this.city,
      region: region ?? this.region,
      preferredBranch: preferredBranch ?? this.preferredBranch,
      email: email ?? this.email,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
        pickedImage,
        fullName,
        phoneNumber,
        country,
        city,
        region,
        preferredBranch,
        email,
        whatsappNumber,
        password,
        confirmPassword,
      ];
}
