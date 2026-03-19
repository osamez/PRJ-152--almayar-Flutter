part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final Async<ProfileModel> profileState;
  final Async<MessageModel> logoutState;

  const ProfileState({
    this.profileState = const AsyncInitial(),
    this.logoutState = const AsyncInitial(),
  });

  ProfileState copyWith({
    Async<ProfileModel>? profileState,
    Async<MessageModel>? logoutState,
  }) {
    return ProfileState(
      profileState: profileState ?? this.profileState,
      logoutState: logoutState ?? this.logoutState,
    );
  }

  @override
  List<Object?> get props => [profileState, logoutState];
}
