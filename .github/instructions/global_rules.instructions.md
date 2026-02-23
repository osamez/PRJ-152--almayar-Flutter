# Role: Senior Flutter Clean Architecture Expert

## 1. Core Architecture & Data Flow
Each feature strictly follows this folder structure:
```text
feature_name/
├── data/
│   ├── models/           
│   ├── datasource/       
│   ├── repos/            
│   └── api_service/      
├── presentation/
│   ├── cubits/
│   ├── views/
│   ├── widgets/
│   └── feature_name_imports.dart
└── di/                   
3. Strict Presentation Layer Rules (Views, Widgets & Imports)
The Barrel File (feature_name_imports.dart): This file acts as the SINGLE source of imports for the entire presentation layer.

You MUST use export statements in this file to expose everything the presentation layer needs (e.g., flutter/material.dart, flutter_screenutil, Cubits, States, Views, Widgets, core utilities like AppSizes, and models).

Strict Import Rule: Files inside presentation/views/, presentation/widgets/, and presentation/cubits/ MUST NOT contain any direct imports to Flutter packages or other files.

They MUST contain ONLY ONE single import statement pointing to their corresponding feature_name_imports.dart file.

Views Folder (views/): A View class MUST only return a Scaffold widget.

The body of the Scaffold MUST be a separate widget called ScreenNameViewBody().

Example: return Scaffold(body: ScreenNameViewBody());

Widgets Folder (widgets/): The ScreenNameViewBody implementation goes here.

Multiple Screens Rule: If the feature has more than one screen, you MUST create separated sub-folders inside widgets/. Each sub-folder MUST be named after the screen to hold all widgets related to that specific screen.

4. UI Refactoring & ScreenUtil Sizing Rules (AppSizes)
When refactoring or creating UI screens/widgets, you MUST NEVER leave hardcoded flutter_screenutil values (e.g., 10.w, 15.h, 20.r) inside the UI code. You must use the centrally managed AppSizes class located in utils/app_sizes.dart.

Workflow for Sizing:
Search & Replace: Look for any value using .w or .h (e.g., 10.w).

Check AppSizes: Check if AppSizes.w10 or AppSizes.h10 exists in the AppSizes class.

Use Existing: If it exists, replace 10.w with AppSizes.w10 and 10.h with AppSizes.h10 in the UI file.

Auto-Generate Missing Sizes: If the value X (e.g., 17) does NOT exist in AppSizes, you MUST update the app_sizes.dart file automatically by adding BOTH the width and height for that value.

Steps to Update app_sizes.dart:
If a new size X is discovered:

Add the variable declarations in the class body:

Dart
static late double wX;
static late double hX;
Add initializations inside the init() method:

Dart
wX = X.w; 
hX = X.h;
5. Dependency Injection (DI) & State Management
DI: Use GetIt. Each feature has its own DI setup in the di/ folder. Always use getIt<T>() to inject dependencies.

State Management: Use flutter_bloc (Cubit pattern).

Naming: FeatureNameCubit, FeatureNameState (extending Equatable or using sealed class).

Keep business logic OUT of the Cubit. The Cubit only coordinates UseCases/Repos and emits states (Initial → Loading → Success/Failure).

6. Performance & UI Rules
Const & Final: Always use const constructors and final for immutable fields.

Rebuilds: Minimize rebuilds. Use BlocBuilder.buildWhen or granular state management to rebuild only what's necessary.

Widgets: Prefer StatelessWidget. Avoid large build() methods; extract complex UI into smaller pure widgets.

Heavy UI: Use RepaintBoundary for heavy widgets (charts, maps) and implement pagination for long lists (ListView.builder).

Memory: Always dispose() controllers. Don't call setState during build().

7. Effective Dart & Code Style
Naming: - snake_case for files and folders.

PascalCase for classes and enums.

camelCase for variables and functions.

Types: Strictly type annotate variables, return types, and functions. Avoid dynamic.

Formatting: Code must be formatted using dart format. Use curly braces {} for all flow control statements.

Responsibility: Keep files short and focused on a single responsibility (SOLID principles).

C. Typography (AppTextStyleFactory):

NEVER instantiate TextStyle() directly to save memory.

ALWAYS use the caching factory AppTextStyleFactory.create() from core/theme/app_text_styles_factory.dart.

Example: style: AppTextStyleFactory.create(size: AppSizes.h16, weight: FontWeight.w600, color: AppColors.primary),

5. Localization & Hardcoded Strings
NEVER use hardcoded strings in the UI (e.g., Text('Login')).

ALWAYS use easy_localization with the generated LocaleKeys class.

The LocaleKeys class is located at lib/generated/locale_keys.g.dart and is globally exported via core/utils/exports.dart — no extra import needed in widgets.

Workflow:
1. Add the new key and value to BOTH assets/lang/ar.json and assets/lang/en.json.
2. ⚠️ MANDATORY — YOU must run BOTH commands below in order, every single time after editing any lang JSON file. NEVER skip this step, NEVER ask the user to run them:
   dart run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/lang
   dart run easy_localization:generate -S assets/lang
3. Access the key ALWAYS via the generated constant, NEVER as a raw string:
   ✅ CORRECT:   Text(LocaleKeys.login.tr())
   ❌ FORBIDDEN: Text('login'.tr())
4. For data models that store keys (e.g. onBoardingData), use LocaleKeys constants:
   ✅ CORRECT:   title: LocaleKeys.onboarding_title_1
   ❌ FORBIDDEN: title: 'onboarding_title_1'
   Then call .tr() at the display site: Text(data.title.tr())

6. Routing (go_router)
We use go_router. The setup is in core/Routing/ (routes.dart and app_router.dart).

NEVER use Flutter's default Navigator. ALWAYS use context.push(Routes.routeName) or context.go(Routes.routeName).

When creating a new screen:

Add a static const string in Routes class inside routes.dart (e.g., static const String newScreen = '/new-screen';).

Add the GoRoute configuration in app_router.dart.

7. Dependency Injection & State Management
DI: Use GetIt. Each feature has its own DI setup in the di/ folder. Use getIt<T>().

State Management: Use flutter_bloc (Cubit pattern). Keep logic OUT of the Cubit.