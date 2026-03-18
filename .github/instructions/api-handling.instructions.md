---
trigger: model_decision
---

# Role: Flutter Clean Architecture & API Expert

## 1. Context & Architecture

You are an expert Flutter developer using a Feature-First Clean Architecture approach.
Your task is to generate or update the Data Layer for a specific feature based on the provided Endpoints, JSON payloads, and parameters.

- **Smart Generation:** If a file already exists, **APPEND/UPDATE** it without removing existing code. If it doesn't exist, **CREATE** it from scratch.
- **Stack:** `dio`, `retrofit`, `json_annotation`.
- **Error Handling:** Use a custom `Result<T>` sealed class (with `Success` and `Error` factories). Errors are handled implicitly via `AppErrorHandler` inside the `Result.failure` factory.
- **Logging:** Use the custom `AppLogger` class (`AppLogger.info` for success, `AppLogger.error` for exceptions).
- \*\*Apply dart run build_runner build --delete-conflicting-outputs to generate the models and update the api_servcie.

## 2. Folder Structure per Feature

feature_name/
├── data/
│ ├── models/ # Request/Response models
│ ├── datasource/ # Abstract DataSource ({feature}_datasource.dart) and DataSourceImpl ({feature}_datasource_impl.dart)
│ ├── repos/ # Abstract Repo ({feature}_repo.dart) and RepoImpl ({feature}_repo_impl.dart)
│ └── api_service/ # Retrofit interface

## 3. Workflow Steps (Strict Order)

### Step 0: Add Endpoint to `ApiConstants` (`core/network/api_constants.dart`)

- **EVERY** endpoint string MUST be defined as a `static const String` in the `ApiConstants` class located at `lib/core/network/api_constants.dart`.
- **NEVER** hardcode endpoint strings directly in the ApiService. Always reference them via `ApiConstants.endpointName`.
- Group constants by feature with a comment header.

```dart
// Example of ApiConstants
class ApiConstants {
  const ApiConstants._();

  // Auth
  static const String login = 'user/auth/login';

  // Users
  static const String getUsers = 'api/v1/users';
}
```

### Step 1: Generate/Update Models (`data/models/`)

- Create **Data** models based on the provided JSON data.
- **Naming Convention:** Rename data classes from `Data` or `Response` to `Model` (e.g., `BranchDetailsData` -> `BranchDetailsModel`).
- Use `@JsonSerializable()` and generate `fromJson`/`toJson`.
- Use strong typing (avoid `dynamic` unless absolutely necessary).
- **BaseResponse Pattern:** Most APIs wrap data in a common structure. Use `BaseResponse<T>` from `core/models/base_response.dart` as the wrapper.
- _Tip:_ Query parameters and simple primitive bodies do not need dedicated Request models.

### Step 2: Create/Update API Service (`data/api_service/`)

- Open/Create `{FeatureName}ApiService`.
- Add the new Retrofit method.
- **CRITICAL:** Use `ApiConstants.endpointName` for the endpoint path. NEVER hardcode the URL string.
- **Edge Cases Handling:**
  - _Query Params:_ Use `@Query('name')` or `@Queries()`.
  - _Custom Headers:_ Use `@Header('key')`.
  - _File Uploads:_ Use `@MultiPart()` on the method and `@Part(name: "file") File file` for the payload.

```dart
// Example of ApiService
@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiConstants.login)
  Future<BaseResponse<LoginModel>> login(@Body() LoginRequest request);

  @GET(ApiConstants.getUsers)
  Future<BaseResponse<List<UserModel>>> getUsers(@Query('page') int page);
}
```
### Step 3: Create/Update DataSource (`data/datasource/`)

- Create **abstract class** `{FeatureName}DataSource` in `{feature_name}_datasource.dart`.
- Create its **implementation class** `{FeatureName}DataSourceImpl` in a **SEPARATE** file: `{feature_name}_datasource_impl.dart`.
- **MANDATORY:** Do NOT keep the implementation in the same file as the abstract class.
- `DataSourceImpl` MUST take `{FeatureName}ApiService` in its constructor via DI.
- Implement the new method by directly calling the ApiService.

```dart
// Example of DataSource Impl
class AuthDataSourceImpl implements AuthDataSource {
  final AuthApiService _apiService;
  const AuthDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<LoginModel>> login(LoginRequest request) async {
    return await _apiService.login(request);
  }
}
```
### Step 4: Create/Update Repository (`data/repos/`) -> CRITICAL LAYER

- Create **abstract class** `{FeatureName}Repo` in `{feature_name}_repo.dart`.
- Create its **implementation class** `{FeatureName}RepoImpl` in a **SEPARATE** file: `{feature_name}_repo_impl.dart`.
- **MANDATORY:** Do NOT keep the implementation in the same file as the abstract class.
- `RepoImpl` MUST take `{FeatureName}DataSource` in its constructor.

Strict Implementation Rules for the new method:

The return type MUST be `Future<Result<BaseResponse<{Model}>>>` (or `Future<Result<BaseResponse<List<{Model}>>>>`).

You MUST wrap the DataSource call in a try-catch block.

On Success: Log the event AppLogger.info('ClassName - methodName: Success message'); and return Result.success(data).

On Error: Log the event AppLogger.error('ClassName - methodName: Error message', e, stackTrace); and return Result.failure(e, stackTrace). Do NOT handle or map the error manually; the factory handles it.

```dart
// Example of Repo Impl
class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _dataSource;
  const AuthRepoImpl(this._dataSource);

  @override
  Future<Result<BaseResponse<LoginModel>>> login(LoginRequest request) async {
    try {
      final response = await _dataSource.login(request);
      AppLogger.info('AuthRepoImpl - login: Successfully logged in');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('AuthRepoImpl - login: Failed to login', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }
}

Step 5: Dependency Injection (DI) Check
If you CREATED new files (ApiService, DataSource, Repo) in this prompt, explicitly tell the user: "Please remember to register these new classes in your DI container (e.g., GetIt)." - If you only UPDATED existing files, ignore this step.

4. General Code Constraints
Always import AppLogger and Result<T> correctly.

Use const constructors wherever possible.

Do NOT generate Presentation Layer files (UI, Cubit, State) unless explicitly instructed.

Ensure proper code formatting and adhere to SOLID principles.

