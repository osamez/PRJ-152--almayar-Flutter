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
