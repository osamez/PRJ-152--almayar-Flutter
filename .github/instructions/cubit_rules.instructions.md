# Role: Flutter Bloc & State Management Expert (Strict Rules)
When generating Cubits, States, and UI integrations for async operations, you MUST strictly use the custom `Async<T>` sealed class and a single State class pattern. This is crucial for handling multiple independent async operations (e.g., fetching and updating) in the same screen.

### A. State Class Rules:
- **Single State Class:** Do NOT create multiple state classes for a feature.
- **Independent Async Fields:** Wrap each independent async operation in its own `Async<T>` property.
- **`copyWith` Method:** The state class MUST have a `copyWith` method to update specific fields without losing the rest of the state.
- **Default Values:** Default the async fields to `AsyncInitial()` or `AsyncLoading()`.

**Example:**
```dart
class ProfileState extends Equatable {
  final Async<UserModel> getUserDataState;
  final Async<void> updateUserDataState; // Used for independent update operations
  final bool isEditing;

  const ProfileState({
    this.getUserDataState = const AsyncInitial(),
    this.updateUserDataState = const AsyncInitial(),
    this.isEditing = false,
  });

  ProfileState copyWith({
    Async<UserModel>? getUserDataState,
    Async<void>? updateUserDataState,
    bool? isEditing,
  }) {
    return ProfileState(
      getUserDataState: getUserDataState ?? this.getUserDataState,
      updateUserDataState: updateUserDataState ?? this.updateUserDataState,
      isEditing: isEditing ?? this.isEditing,
    );
  }

  @override
  List<Object> get props => [getUserDataState, updateUserDataState, isEditing];
}
B. Cubit Implementation Rules:
The Cubit communicates ONLY with the Repository (or UseCase).

Each operation MUST only emit and update its specific Async<T> field using copyWith.

Example:

Dart
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _repository;

  ProfileCubit(this._repository) : super(const ProfileState());

  // Operation 1: Fetching Data
  Future<void> getUserData() async {
    emit(state.copyWith(getUserDataState: const AsyncLoading()));

    final result = await _repository.getUserData();

    result.when(
      onSuccess: (data) => emit(state.copyWith(getUserDataState: AsyncData(data))),
      onError: (error) => emit(state.copyWith(getUserDataState: AsyncError(error.message ?? 'Error'))),
    );
  }

  // Operation 2: Updating Data
  Future<void> updateUserData(UpdateUserRequest request) async {
    emit(state.copyWith(updateUserDataState: const AsyncLoading()));

    final result = await _repository.updateUserData(request);

    result.when(
      onSuccess: (_) => emit(state.copyWith(updateUserDataState: const AsyncData(null))),
      onError: (error) => emit(state.copyWith(updateUserDataState: AsyncError(error.message ?? 'Error'))),
    );
  }
}
C. UI Implementation Rules (BlocBuilder & BlocListener):
BlocBuilder: Use .when() on the fetch state (getUserDataState) to build the main UI layout.

BlocListener: Listen to the action/update state (updateUserDataState) to show dialogs, toasts, or navigation without rebuilding the whole layout.

Example:

Dart
// 1. Listening to the Update operation (e.g., showing a toast)
BlocListener<ProfileCubit, ProfileState>(
  listenWhen: (previous, current) => previous.updateUserDataState != current.updateUserDataState,
  listener: (context, state) {
    state.updateUserDataState.whenOrNull(
      loading: () => showLoadingDialog(context),
      data: (_) {
        hideLoadingDialog(context);
        showToast('Profile updated successfully');
      },
      error: (msg) {
        hideLoadingDialog(context);
        showToast(msg, isError: true);
      },
    );
  },
  // 2. Building the UI based on the Fetch operation
  child: BlocBuilder<ProfileCubit, ProfileState>(
    buildWhen: (previous, current) => previous.getUserDataState != current.getUserDataState,
    builder: (context, state) {
      return state.getUserDataState.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const CircularProgressIndicator(),
        data: (user) => Text('Hello, ${user.name}'),
        error: (msg) => Text(msg, style: AppTextStyleFactory.create(size: AppSizes.h14, weight: FontWeight.w400, color: AppColors.red)),
      );
    },
  ),
);

D. BlocSelector Implementation Rules (Performance Optimization):Use Case: Use BlocSelector when a widget depends on a specific property of the state, not the whole state object. This prevents unnecessary rebuilds when other independent Async<T> fields or variables change.Criteria: Use it for high-frequency updates or small UI components like Cart Badges, Favorite Icons, or Checkbox states.Example 1: Favorite Button (Selective Rebuild)Dart// Only rebuilds the Heart Icon when 'isFavorite' changes inside the Async data
BlocSelector<ProductCubit, ProductState, bool>(
  selector: (state) {
    // Select only the piece of data we care about
    return state.productDetailState.valueOrNull?.isFavorite ?? false;
  },
  builder: (context, isFavorite) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      onPressed: () => context.read<ProductCubit>().toggleFavorite(),
    );
  },
);
Example 2: Cart Badge (Selective Rebuild)Dart// Only rebuilds the Badge text when the length of the cart list changes
// Even if 'updateCartState' is Loading, this widget WON'T rebuild.
BlocSelector<CartCubit, CartState, int>(
  selector: (state) {
    return state.cartItemsState.valueOrNull?.length ?? 0;
  },
  builder: (context, cartCount) {
    return Badge(
      label: Text('$cartCount'),
      child: const Icon(Icons.shopping_cart),
    );
  },
);
E. Decision Matrix (Which one to use?):ToolBest Used For...Performance ImpactBlocBuilderBuilding the main layout based on Async<T>.when().Moderate (rebuilds on any buildWhen condition).BlocSelectorAtomic widgets (Icons, Badges, Text) depending on one field.Lowest (only rebuilds if the selected value changes).BlocListenerSide effects only (Toasts, Nav, Dialogs).Zero Rebuilds (Side effect only).