part of '../../feature_imports.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final InternetService _internetService;
  final ProfileRepo _profileRepo;

  UpdateProfileCubit({
    required InternetService internetService,
    required ProfileRepo profileRepo,
  }) : _internetService = internetService,
       _profileRepo = profileRepo,
       super(const UpdateProfileState());

  void initWithProfile(ProfileModel profile) {
    emit(
      state.copyWith(
        whatsapp2Key: profile.whatsapp2?.key,
        whatsapp3Key: profile.whatsapp3?.key,
        whatsapp4Key: profile.whatsapp4?.key,
      ),
    );
  }

  void changeWhatsappKey({required int index, required String key}) {
    if (index == 2) emit(state.copyWith(whatsapp2Key: key));
    if (index == 3) emit(state.copyWith(whatsapp3Key: key));
    if (index == 4) emit(state.copyWith(whatsapp4Key: key));
  }

  Future<void> pickImage(ImageSourceType source) async {
    final imagePicker = getIt<ImagePickerService>();
    final image = await imagePicker.pickImage(type: source);
    if (image != null) {
      emit(state.copyWith(selectedImage: image));
    }
  }

  void removeImage() {
    emit(state.copyWith(clearSelectedImage: true));
  }

  Future<void> updateProfile({
    required ProfileModel initialProfile,
    String? whatsapp2,
    String? whatsapp3,
    String? whatsapp4,
  }) async {
    // Change detection
    final isImageChanged = state.selectedImage != null;
    final isWhatsapp2Changed =
        whatsapp2 != initialProfile.whatsapp2?.number?.toString() ||
        state.whatsapp2Key != initialProfile.whatsapp2?.key;
    final isWhatsapp3Changed =
        whatsapp3 != initialProfile.whatsapp3?.number?.toString() ||
        state.whatsapp3Key != initialProfile.whatsapp3?.key;
    final isWhatsapp4Changed =
        whatsapp4 != initialProfile.whatsapp4?.number?.toString() ||
        state.whatsapp4Key != initialProfile.whatsapp4?.key;

    if (!isImageChanged &&
        !isWhatsapp2Changed &&
        !isWhatsapp3Changed &&
        !isWhatsapp4Changed) {
      return; // No changes
    }

    emit(state.copyWith(updateProfileState: const AsyncLoading()));
    if (await _internetService.isConnected()) {
      final result = await _profileRepo.updateProfile(
        image: state.selectedImage,
        whatsapp2: whatsapp2,
        whatsapp2Key: state.whatsapp2Key,
        whatsapp3: whatsapp3,
        whatsapp3Key: state.whatsapp3Key,
        whatsapp4: whatsapp4,
        whatsapp4Key: state.whatsapp4Key,
      );
      result.when(
        onSuccess: (message) {
          emit(
            state.copyWith(
              updateProfileState: AsyncData(message),
              clearSelectedImage: true,
            ),
          );
        },
        onFailure: (failure) {
          emit(state.copyWith(updateProfileState: AsyncError(failure)));
        },
      );
    } else {
      emit(
        state.copyWith(
          updateProfileState: AsyncError(
            ApiErrorModel(
              error: 'No Internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
    }
  }

  Future<void> deleteAccount() async {
    emit(state.copyWith(deleteAccountState: const AsyncLoading()));
    if (await _internetService.isConnected()) {
      final result = await _profileRepo.deleteAccount();
      result.when(
        onSuccess: (message) async {
          await CacheHelper.clearAllSecuredData();
          await CacheHelper().clearData();
          emit(state.copyWith(deleteAccountState: AsyncData(message)));
        },
        onFailure: (failure) {
          emit(state.copyWith(deleteAccountState: AsyncError(failure)));
        },
      );
    } else {
      emit(
        state.copyWith(
          deleteAccountState: AsyncError(
            ApiErrorModel(
              error: 'No Internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
    }
  }
}
