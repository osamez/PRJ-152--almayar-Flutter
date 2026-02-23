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
}
