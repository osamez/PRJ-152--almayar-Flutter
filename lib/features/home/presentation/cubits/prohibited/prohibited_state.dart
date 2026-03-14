part of '../../feature_imports.dart';

class ProhibitedState extends Equatable {
  final Async<ProhibitedModel> fetchProhibitedDataState;

  const ProhibitedState({this.fetchProhibitedDataState = const AsyncInitial()});

  ProhibitedState copyWith({Async<ProhibitedModel>? fetchProhibitedDataState}) {
    return ProhibitedState(
      fetchProhibitedDataState:
          fetchProhibitedDataState ?? this.fetchProhibitedDataState,
    );
  }

  @override
  List<Object?> get props => [fetchProhibitedDataState];
}
