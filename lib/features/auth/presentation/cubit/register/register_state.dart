part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final Async<List<CountryLocationModel>> getLocationsState;
  final Async<List<ReceivingBranchModel>> getBranchesState;
  final Async<MessageModel> registerState;

  final int currentStep;
  final File? pickedImage;
  final String fullName;
  final String phoneNumber;
  final String? phoneKey;
  final String email;
  final String whatsappNumber;
  final String? whatsappKey;
  final String password;
  final String confirmPassword;
  final String notes;

  final CountryLocationModel? selectedCountry;
  final CityModel? selectedCity;
  final RegionModel? selectedRegion;
  final ReceivingBranchModel? selectedBranch;

  const RegisterState({
    this.getLocationsState = const AsyncInitial(),
    this.getBranchesState = const AsyncInitial(),
    this.registerState = const AsyncInitial(),
    this.currentStep = 1,
    this.pickedImage,
    this.fullName = '',
    this.phoneNumber = '',
    this.phoneKey = '+218',
    this.email = '',
    this.whatsappNumber = '',
    this.whatsappKey = '+218',
    this.password = '',
    this.confirmPassword = '',
    this.notes = '',
    this.selectedCountry,
    this.selectedCity,
    this.selectedRegion,
    this.selectedBranch,
  });

  static const int totalSteps = 3;
  bool get isLastStep => currentStep == totalSteps;

  static const _sentinel = Object();

  RegisterState copyWith({
    Async<List<CountryLocationModel>>? getLocationsState,
    Async<List<ReceivingBranchModel>>? getBranchesState,
    Async<MessageModel>? registerState,
    int? currentStep,
    Object? pickedImage = _sentinel,
    String? fullName,
    String? phoneNumber,
    String? phoneKey,
    String? email,
    String? whatsappNumber,
    String? whatsappKey,
    String? password,
    String? confirmPassword,
    String? notes,
    Object? selectedCountry = _sentinel,
    Object? selectedCity = _sentinel,
    Object? selectedRegion = _sentinel,
    Object? selectedBranch = _sentinel,
  }) {
    return RegisterState(
      getLocationsState: getLocationsState ?? this.getLocationsState,
      getBranchesState: getBranchesState ?? this.getBranchesState,
      registerState: registerState ?? this.registerState,
      currentStep: currentStep ?? this.currentStep,
      pickedImage: pickedImage == _sentinel ? this.pickedImage : pickedImage as File?,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneKey: phoneKey ?? this.phoneKey,
      email: email ?? this.email,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      whatsappKey: whatsappKey ?? this.whatsappKey,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      notes: notes ?? this.notes,
      selectedCountry: selectedCountry == _sentinel ? this.selectedCountry : selectedCountry as CountryLocationModel?,
      selectedCity: selectedCity == _sentinel ? this.selectedCity : selectedCity as CityModel?,
      selectedRegion: selectedRegion == _sentinel ? this.selectedRegion : selectedRegion as RegionModel?,
      selectedBranch: selectedBranch == _sentinel ? this.selectedBranch : selectedBranch as ReceivingBranchModel?,
    );
  }

  @override
  List<Object?> get props => [
        getLocationsState,
        getBranchesState,
        registerState,
        currentStep,
        pickedImage,
        fullName,
        phoneNumber,
        phoneKey,
        email,
        whatsappNumber,
        whatsappKey,
        password,
        confirmPassword,
        notes,
        selectedCountry,
        selectedCity,
        selectedRegion,
        selectedBranch,
      ];
}
