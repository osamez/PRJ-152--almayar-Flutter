part of '../../feature_imports.dart';

class GiftCardsState extends Equatable {
  final Async<List<GiftCardModel>> getGiftCardsState;

  const GiftCardsState({
    this.getGiftCardsState = const AsyncInitial(),
  });

  GiftCardsState copyWith({
    Async<List<GiftCardModel>>? getGiftCardsState,
  }) {
    return GiftCardsState(
      getGiftCardsState: getGiftCardsState ?? this.getGiftCardsState,
    );
  }

  @override
  List<Object> get props => [getGiftCardsState];
}
