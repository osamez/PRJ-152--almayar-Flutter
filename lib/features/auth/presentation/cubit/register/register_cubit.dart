import 'dart:io';

import 'package:almeyar/core/services/image_picker_service.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._imagePickerService) : super(const RegisterState());

  final ImagePickerService _imagePickerService;

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
  void updateCountry(String value) => emit(state.copyWith(country: value));
  void updateCity(String value) => emit(state.copyWith(city: value));
  void updateRegion(String value) => emit(state.copyWith(region: value));
  void updatePreferredBranch(String value) => emit(state.copyWith(preferredBranch: value));
  void updateEmail(String value) => emit(state.copyWith(email: value));
  void updateWhatsappNumber(String value) => emit(state.copyWith(whatsappNumber: value));
  void updatePassword(String value) => emit(state.copyWith(password: value));
  void updateConfirmPassword(String value) => emit(state.copyWith(confirmPassword: value));
}
