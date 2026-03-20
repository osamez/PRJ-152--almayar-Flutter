part of 'wallets_cubit.dart';

class WalletsState extends Equatable {
  final Async<List<WalletModel>> getMyWalletsState;

  const WalletsState({
    this.getMyWalletsState = const AsyncInitial(),
  });

  WalletsState copyWith({
    Async<List<WalletModel>>? getMyWalletsState,
  }) {
    return WalletsState(
      getMyWalletsState: getMyWalletsState ?? this.getMyWalletsState,
    );
  }

  @override
  List<Object> get props => [getMyWalletsState];
}
