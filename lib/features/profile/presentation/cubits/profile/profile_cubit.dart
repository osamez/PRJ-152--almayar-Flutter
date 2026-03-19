import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/home/presentation/feature_imports.dart';
import 'package:almeyar/features/profile/data/models/profile_model.dart';
import 'package:almeyar/features/profile/data/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final InternetService _internetService;
  final ProfileRepo _profileRepo;
  ProfileCubit({
    required InternetService internetService,
    required ProfileRepo profileRepo,
  }) : _internetService = internetService,
       _profileRepo = profileRepo,
       super(const ProfileState());

  Future<void> getProfile() async {
    emit(state.copyWith(profileState: const AsyncLoading()));
    if (await _internetService.isConnected()) {
      final result = await _profileRepo.getProfile();
      result.when(
        onSuccess: (profile) {
          emit(state.copyWith(profileState: AsyncData(profile.data!)));
        },
        onFailure: (failure) {
          emit(state.copyWith(profileState: AsyncError(failure)));
        },
      );
    } else {
      emit(
        state.copyWith(
          profileState: AsyncError(
            ApiErrorModel(
              error: 'No Internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(logoutState: const AsyncLoading()));
    if (await _internetService.isConnected()) {
      final result = await _profileRepo.logout();
      result.when(
        onSuccess: (message) {
          emit(state.copyWith(logoutState: AsyncData(message)));
        },
        onFailure: (failure) {
          emit(state.copyWith(logoutState: AsyncError(failure)));
        },
      );
    } else {
      emit(
        state.copyWith(
          logoutState: AsyncError(
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
