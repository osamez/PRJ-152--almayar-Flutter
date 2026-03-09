# Initial Route Handling

## Task Breakdown

- [x] Check how token and isShowingOnboarding are read/written
- [x] Determine the asynchronous or synchronous nature of retrieving token from storage
- [x] Implement initial route logic in app_router.dart
- [x] Verify functionality

## Implementation Plan

This plan outlines the steps to dynamically handle the initial route of the app based on the presence of a user token and the onboarding completion state.

### Proposed Changes

#### Core Routing

**[MODIFY] `lib/core/routing/app_router.dart`**

- Declare a global variable `late String initialRoute;`.
- Change `initialLocation: Routes.login,` to `initialLocation: initialRoute,` in the `GoRouter` configuration.

**[MODIFY] `lib/main.dart`**

- In `main()`, right after `await CacheHelper().init();`, add logic to determine the `initialRoute`:
  - Fetch the token: `final token = await CacheHelper.getSecuredString(PrefsKeys.token);`
  - Fetch the onboarding status: `final isShowingOnboarding = CacheHelper().getBool(key: PrefsKeys.isShowingOnboarding);`
  - Set the route based on the conditions:
    - If `token != null && token.isNotEmpty`, route to `Routes.main`
    - Else if `isShowingOnboarding == true`, route to `Routes.login`
    - Else, route to `Routes.onboarding`
- Ensure that `import 'package:almeyar/core/utils/prefs_keys.dart';` is imported in `main.dart` if it is not already.

### Verification Plan

- Start the application with a clean cache and verify it routes to `OnboardingView`.
- Skip or complete onboarding, then restart the application to verify it routes to `LoginView`.
- Mock a login attempt by saving a token to secure storage, and verify it routes to `MainView` directly without showing login or onboarding.

---

## Walkthrough

The initial route logic has successfully been implemented, ensuring the application redirects appropriately based on the preserved token and the user's onboarding completion status.

### Changes Made

**1. `lib/core/routing/app_router.dart`**

- A global variable `initialRoute` has been introduced.
- The `GoRouter` configuration `initialLocation` has been updated from a hardcoded `Routes.login` to utilize the `initialRoute` variable dynamically.

```diff
-  initialLocation: Routes.login,
+  initialLocation: initialRoute,
```

**2. `lib/main.dart`**

- Modified the `main` application initialization method to query the token and onboarding flags asynchronously.
- The token retrieval leverages `CacheHelper.getSecuredString`.
- A conditional statement handles routing users:
  1. To **`Routes.main`** if a user has a valid access token.
  2. To **`Routes.login`** if the user has observed the onboarding.
  3. Otherwise, drops off at **`Routes.onboarding`** by default.

```dart
  await CacheHelper().init();

  final token = await CacheHelper.getSecuredString(PrefsKeys.token);
  final isShowingOnboarding =
      CacheHelper().getBool(key: PrefsKeys.isShowingOnboarding);

  if (token != null && token.isNotEmpty) {
    initialRoute = Routes.main;
  } else if (isShowingOnboarding == true) {
    initialRoute = Routes.login;
  } else {
    initialRoute = Routes.onboarding;
  }
```

### Validation

- Ran `dart analyze` to ensure there are no compilation or semantic errors in the modified file contexts.
- Removed unused imports to fix a minor linter warning in `main.dart`.
