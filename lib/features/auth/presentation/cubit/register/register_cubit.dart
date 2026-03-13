import 'dart:io';

import 'package:almeyar/core/services/image_picker_service.dart';
import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/features/auth/data/models/country_locations_response.dart';
import 'package:almeyar/features/auth/data/models/receiving_branch_model.dart';
import 'package:almeyar/features/auth/data/models/register_request.dart';
import 'package:almeyar/features/auth/data/repositories/auth_repo.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo _authRepo;
  final ImagePickerService _imagePickerService;

  RegisterCubit(this._authRepo, this._imagePickerService) : super(const RegisterState());

  Future<void> getCountryLocations() async {
    emit(state.copyWith(getLocationsState: const AsyncLoading()));

    final result = await _authRepo.getCountryLocations();

    result.when(
      onSuccess: (response) => emit(state.copyWith(
        getLocationsState: AsyncData(response.data ?? []),
      )),
      onFailure: (error) => emit(state.copyWith(
        getLocationsState: AsyncError(error.message ?? 'Unknown Error'),
      )),
    );
  }

  Future<void> getReceivingBranches() async {
    emit(state.copyWith(getBranchesState: const AsyncLoading()));

    final result = await _authRepo.getReceivingBranches();

    result.when(
      onSuccess: (branches) => emit(state.copyWith(
        getBranchesState: AsyncData(branches),
      )),
      onFailure: (error) => emit(state.copyWith(
        getBranchesState: AsyncError(error.message ?? 'Unknown Error'),
      )),
    );
  }

  Future<void> register() async {
    if (state.pickedImage == null) {
      emit(state.copyWith(
        registerState: const AsyncError('please_select_id_photo'),
      ));
      return;
    }
    emit(state.copyWith(registerState: const AsyncLoading()));

    final request = RegisterRequest(
      name: state.fullName,
      email: state.email,
      branchId: state.selectedBranch?.id.toString(),
      countryId: state.selectedCountry?.id.toString(),
      cityId: state.selectedCity?.id,
      regionId: state.selectedRegion?.id,
      phone: state.phoneNumber,
      phoneKey: state.phoneKey,
      whatsappPhone: state.whatsappNumber,
      whatsappKey: state.whatsappKey,
      password: state.password,
      passwordConfirmation: state.confirmPassword,
      notes: state.notes,
      nationalIdentityPhoto: state.pickedImage,
    );

    final result = await _authRepo.register(request);

    result.when(
      onSuccess: (message) => emit(state.copyWith(registerState: AsyncData(message))),
      onFailure: (error) => emit(state.copyWith(registerState: AsyncError(error.message ?? 'Unknown Error'))),
    );
  }

  void nextStep() {
    if (!state.isLastStep) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void previousStep() {
    if (state.currentStep > 1) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  Future<void> pickImage(ImageSourceType type) async {
    final File? image = await _imagePickerService.pickImage(type: type);
    if (image != null) {
      emit(state.copyWith(pickedImage: image));
    }
  }

  void removeImage() {
    emit(state.copyWith(pickedImage: null));
  }

  void updateFullName(String value) => emit(state.copyWith(fullName: value));
  void updatePhoneNumber(String value) => emit(state.copyWith(phoneNumber: value));
  void updatePhoneKey(String value) => emit(state.copyWith(phoneKey: value));
  void updateEmail(String value) => emit(state.copyWith(email: value));
  void updateWhatsappNumber(String value) => emit(state.copyWith(whatsappNumber: value));
  void updateWhatsappKey(String value) => emit(state.copyWith(whatsappKey: value));
  void updatePassword(String value) => emit(state.copyWith(password: value));
  void updateConfirmPassword(String value) => emit(state.copyWith(confirmPassword: value));
  void updateNotes(String value) => emit(state.copyWith(notes: value));

  void selectCountry(CountryLocationModel? country) {
    emit(state.copyWith(
      selectedCountry: country,
      selectedCity: null,
      selectedRegion: null,
    ));
  }

  void selectCity(CityModel? city) {
    emit(state.copyWith(
      selectedCity: city,
      selectedRegion: null,
    ));
  }

  void selectRegion(RegionModel? region) {
    emit(state.copyWith(selectedRegion: region));
  }

  void selectBranch(ReceivingBranchModel? branch) {
    emit(state.copyWith(selectedBranch: branch));
  }
}
