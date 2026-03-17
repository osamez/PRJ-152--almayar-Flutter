---
trigger: model_decision
---

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
  final Async<void> updateUserDataState;
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
```

### B. Cubit Implementation Rules:

- The Cubit communicates ONLY with the Repository (or UseCase).
- Each operation MUST only emit and update its specific `Async<T>` field using `copyWith`.
- **NO controllers, FormKeys, or UI logic in the Cubit.** Controllers and form validation belong in the UI (StatefulWidget). The Cubit receives data (e.g., a Request model) as a parameter.
- **Internet Connectivity Check:** ALWAYS check for internet connectivity before calling the repository if the data is displayed on the UI. Inject `InternetService` into the Cubit and use `await _internetService.isConnected()`.

**Example:**

```dart
class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  final InternetService _internetService;

  AuthCubit(this._authRepo, this._internetService) : super(const AuthState());

  Future<void> login(LoginRequest request) async {
    emit(state.copyWith(loginState: const AsyncLoading()));

    // 1. Check for internet connection
    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          loginState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    // 2. Call repository
    final result = await _authRepo.login(request);

    result.when(
      onSuccess: (data) => emit(state.copyWith(loginState: AsyncData(data))),
      onFailure: (error) => emit(state.copyWith(loginState: AsyncError(error))),
    );
  }
}
```

### C. UI Rules — Controllers & Form Validation:

- **Controllers and FormKeys live in the UI**, inside a `StatefulWidget`. Dispose them in `dispose()`.
- The UI validates the form, then constructs the Request model and passes it to the Cubit method.

**Example:**

```dart
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthCubit>().login(
      LoginRequest(
        whatsappNumber: _phoneController.text.trim(),
        whatsappKey: '+20',
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        // ... form fields with controllers & validators
        AppElevatedButton(onPressed: _onSubmit, text: 'Login'),
      ]),
    );
  }
}
```

### D. BlocListener — Separate File Rule:

- **NEVER** inline `BlocListener` directly inside the UI form/body widget.
- **ALWAYS** create a dedicated `{ScreenName}BlocListener` widget in its **own file** inside `widgets/{screen_name}/`.
- **Do NOT wrap the view with the listener**. Instead, the listener widget should take no `child` parameter, return `const SizedBox.shrink()` as its child, and be added to the `children` list of your `Column` or similar layout widget.
- Register it as a `part` in the feature's `feature_imports.dart`.

**File: `widgets/login/login_bloc_listener.dart`**

```dart
part of '../../feature_imports.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.loginState != current.loginState,
      listener: (context, state) {
        state.loginState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (_) {
            LoadingDialog.hide(context);
            context.go(Routes.main);
          },
          error: (msg) {
            LoadingDialog.hide(context);
            showAppSnackbar(context: context, type: SnackbarType.error, description: msg);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
```

**Usage in the form:**

```dart
// Inside LoginForm build()
return Form(
  key: _formKey,
  child: Column(
    children: [
      const LoginBlocListener(),
      // ... form content
    ],
  ),
);
```

### E. BlocBuilder Rules — Main UI Logic:

Use `.when()` on the fetch state to build the main UI layout. To provide a premium experience, ALWAYS handle Loading (Skeletonizer) and Errors (Internet/Generic) correctly.

**Standard Pattern:**

```dart
@override
Widget build(BuildContext context) {
  return BlocBuilder<FeatureCubit, FeatureState>(
    buildWhen: (previous, current) => previous.getDataState != current.getDataState,
    builder: (context, state) {
      return state.getDataState.when(
        initial: () => const SizedBox.shrink(),
        loading: () => _buildContent(context, state, isLoading: true), // Use helper
        data: (data) {
          // Rule: If empty state should replace the whole layout, handle it here.
          // Rule: If empty state should only replace a part (e.g., keeping search bar/filters), handle it inside _buildContent.
          return _buildContent(context, state, data: data);
        },
        error: (failure) {
          if (failure.status == LocalStatusCodes.connectionError) {
            return InternetConnectionWidget(
              onPressed: () => context.read<FeatureCubit>().getData(),
            );
          }
          return CustomErrorWidget(
            message: failure.error,
            onPressed: () => context.read<FeatureCubit>().getData(),
          );
        },
      );
    },
  );
}

// Helper method to keep UI structure DRY
Widget _buildContent(BuildContext context, FeatureState state, {T? data, bool isLoading = false}) {
  return Skeletonizer(
    enabled: isLoading,
    child: ListView.builder(
      itemCount: data?.length ?? 5, // Mock count for skeleton
      itemBuilder: (context, index) {
        final item = data?[index] ?? const MockModel(); // Mock data for skeleton
        return ItemWidget(item: item);
      },
    ),
  );
}
```

### F. BlocSelector Rules (Performance Optimization):

Use `BlocSelector` when a widget depends on a **specific property** of the state. This prevents unnecessary rebuilds.

**Example: Favorite Button**

```dart
BlocSelector<ProductCubit, ProductState, bool>(
  selector: (state) => state.productDetailState.valueOrNull?.isFavorite ?? false,
  builder: (context, isFavorite) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      onPressed: () => context.read<ProductCubit>().toggleFavorite(),
    );
  },
);
```

### G. Decision Matrix:

| Tool           | Best Used For                                                | Performance Impact |
| -------------- | ------------------------------------------------------------ | ------------------ |
| `BlocBuilder`  | Main layout based on `Async<T>.when()`                       | Moderate           |
| `BlocSelector` | Atomic widgets (Icons, Badges, Text)                         | Lowest             |
| `BlocListener` | Side effects only (Toasts, Nav, Dialogs) — **separate file** | Zero Rebuilds      |
### H. Handling Multiple Independent Async Operations:

When a screen requires loading multiple datasets simultaneously (e.g., dropdown options, initial profile data), follow the **Multi-Async Pattern** as seen in `price_calculator`.

#### 1. State Class Aggregators:
Add getters to the state to simplify UI logic:

```dart
bool get isLoadingInitial =>
    operationAState.isLoading || operationBState.isLoading;

bool get isErrorInitial =>
    operationAState.isError || operationBState.isError;

ApiErrorModel? get errorInitial => (operationAState is AsyncError)
    ? (operationAState as AsyncError).failure
    : (operationBState is AsyncError)
    ? (operationBState as AsyncError).failure
    : null;
```

#### 2. Cubit `loadInitialData`:
Use `Future.wait` for concurrent execution and `toAsyncUnwrapped()` for easy result mapping:

```dart
Future<void> loadInitialData() async {
  emit(state.copyWith(
    operationAState: const AsyncLoading(),
    operationBState: const AsyncLoading(),
  ));

  final results = await Future.wait([
    _repo.fetchA(),
    _repo.fetchB(),
  ]);

  emit(state.copyWith(
    operationAState: (results[0] as Result<T>).toAsyncUnwrapped(),
    operationBState: (results[1] as Result<R>).toAsyncUnwrapped(),
  ));
}
```

#### 3. UI Implementation:
Handle the initial error state globally and wrap the content in `Skeletonizer`:

```dart
@override
Widget build(BuildContext context) {
  return BlocBuilder<MyCubit, MyState>(
    builder: (context, state) {
      if (state.isErrorInitial) {
        return CustomErrorWidget(
          message: state.errorInitial?.message ?? '',
          onPressed: () => context.read<MyCubit>().loadInitialData(),
        ).center;
      }

      return Skeletonizer(
        enabled: state.isLoadingInitial,
        child: MyViewBodyContent(state: state),
      );
    },
  );
}
```

### I. Granular Dropdown / Partial UI BlocBuilders:

Each UI part whose data can **independently** change the UI (e.g., a dropdown whose items are paginated, or a field that reacts to its own async state) MUST have its own dedicated `BlocBuilder` in a **separate file**.

#### Rules:

- **Self-contained widget**: The widget reads its own data from the cubit internally. Do **not** pass data as constructor props.
- **Scoped `buildWhen`**: Only declare the specific state fields this widget depends on.
- **Separate file**: Place the widget in the same `widgets/{screen}/` subfolder and register it as a `part` in `feature_imports.dart`.
- **Outer BlocBuilder scope**: The parent/view-body's `BlocBuilder` must use `buildWhen` to only react to the *initial loading* flags (`isLoadingInitial`, `isErrorInitial`), not to dropdown-level state.

**Example — self-contained dropdown:**

```dart
// widgets/add_purchase_order/add_purchase_order_shopping_site_field.dart
part of '../../feature_imports.dart';

class AddPurchaseOrderShoppingSiteField extends StatelessWidget {
  const AddPurchaseOrderShoppingSiteField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPurchaseOrderCubit, AddPurchaseOrderState>(
      buildWhen: (prev, curr) =>
          prev.shoppingSitesList != curr.shoppingSitesList ||
          prev.selectedShoppingSite != curr.selectedShoppingSite,
      builder: (context, state) {
        final cubit = context.read<AddPurchaseOrderCubit>();
        return CustomDropdownSearchList<ShoppingSiteModel>(
          items: state.shoppingSitesList,
          initialValue: state.selectedShoppingSite,
          onChanged: cubit.selectShoppingSite,
          itemAsString: (item) => item.name ?? '',
          hintText: LocaleKeys.add_purchase_order_shopping_site_hint.tr(),
          // Pagination hooks:
          onPopupOpen: () => cubit.getShoppingSites(page: 1),
          onSearchChanged: (q) => cubit.getShoppingSites(name: q, page: 1),
          onLoadMore: cubit.loadMoreShoppingSites,
          isLoadingMore: state.getShoppingSitesState.isLoading && state.shoppingSitesPage > 1,
          hasMore: state.shoppingSitesHasMore,
        );
      },
    );
  }
}
```

**Usage in parent view body — outer BlocBuilder scoped to initial load only:**

```dart
return BlocBuilder<AddPurchaseOrderCubit, AddPurchaseOrderState>(
  buildWhen: (prev, curr) =>
      prev.isLoadingInitial != curr.isLoadingInitial ||
      prev.isErrorInitial != curr.isErrorInitial,
  builder: (context, state) {
    if (state.isErrorInitial) { ... }
    return Skeletonizer(
      enabled: state.isLoadingInitial,
      child: Column(children: [
        const AddPurchaseOrderShoppingSiteField(), // no props, self-contained
        const AddPurchaseOrderWalletField(),       // no props, self-contained
      ]),
    );
  },
);
```

#### Paginated Dropdown State Pattern:

When a dropdown needs server-side pagination, add these fields to the state:

```dart
final List<T> itemsList;       // accumulated across pages
final int currentPage;         // last loaded page
final bool hasMore;            // whether more pages exist
final Async<Response> fetchState; // tracks per-fetch loading (for spinner)
```

And in the Cubit:

```dart
Future<void> fetchItems({String? name, int page = 1}) async {
  emit(state.copyWith(fetchState: const AsyncLoading()));
  final result = await _repo.fetchItems(name, page);
  result.when(
    onSuccess: (response) {
      final newItems = response.items ?? [];
      final updated = page == 1 ? newItems : [...state.itemsList, ...newItems];
      emit(state.copyWith(
        fetchState: AsyncData(response),
        itemsList: updated,
        currentPage: response.meta?.currentPage ?? page,
        hasMore: (response.meta?.currentPage ?? page) < (response.meta?.lastPage ?? page),
      ));
    },
    onFailure: (error) => emit(state.copyWith(fetchState: AsyncError(error))),
  );
}

Future<void> loadMore({String? name}) async {
  if (state.fetchState.isLoading || !state.hasMore) return;
  await fetchItems(name: name, page: state.currentPage + 1);
}
```
