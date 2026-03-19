part of '../../feature_imports.dart';

class UpdateProfileState extends Equatable {
  final Async<MessageModel> updateProfileState;
  final Async<MessageModel> deleteAccountState;
  final File? selectedImage;
  final String? whatsapp2Key;
  final String? whatsapp3Key;
  final String? whatsapp4Key;

  const UpdateProfileState({
    this.updateProfileState = const AsyncInitial(),
    this.deleteAccountState = const AsyncInitial(),
    this.selectedImage,
    this.whatsapp2Key,
    this.whatsapp3Key,
    this.whatsapp4Key,
  });

  UpdateProfileState copyWith({
    Async<MessageModel>? updateProfileState,
    Async<MessageModel>? deleteAccountState,
    File? selectedImage,
    bool clearSelectedImage = false,
    String? whatsapp2Key,
    String? whatsapp3Key,
    String? whatsapp4Key,
  }) {
    return UpdateProfileState(
      updateProfileState: updateProfileState ?? this.updateProfileState,
      deleteAccountState: deleteAccountState ?? this.deleteAccountState,
      selectedImage:
          clearSelectedImage ? null : selectedImage ?? this.selectedImage,
      whatsapp2Key: whatsapp2Key ?? this.whatsapp2Key,
      whatsapp3Key: whatsapp3Key ?? this.whatsapp3Key,
      whatsapp4Key: whatsapp4Key ?? this.whatsapp4Key,
    );
  }

  @override
  List<Object?> get props => [
    updateProfileState,
    deleteAccountState,
    selectedImage,
    whatsapp2Key,
    whatsapp3Key,
    whatsapp4Key,
  ];
}
