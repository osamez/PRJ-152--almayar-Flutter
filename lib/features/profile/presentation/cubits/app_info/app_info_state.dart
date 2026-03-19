part of '../../feature_imports.dart';

class AppInfoState extends Equatable {
  final Async<String> getAppInfoState;
  final AppInfoType? infoType;

  const AppInfoState({
    this.getAppInfoState = const AsyncInitial(),
    this.infoType,
  });

  AppInfoState copyWith({
    Async<String>? getAppInfoState,
    AppInfoType? infoType,
  }) {
    return AppInfoState(
      getAppInfoState: getAppInfoState ?? this.getAppInfoState,
      infoType: infoType ?? this.infoType,
    );
  }

  @override
  List<Object?> get props => [getAppInfoState, infoType];
}
