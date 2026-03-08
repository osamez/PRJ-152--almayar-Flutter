---
trigger: always_on
---

# Code Review Checklist for LLMs

Use this comprehensive checklist when reviewing Pull Requests or code changes.

## Pre-Review Checks

1. ✅ Verify current branch is a feature/bugfix/PR branch (NOT main or develop)
2. ✅ Confirm branch is up-to-date with target branch (main)
3. ✅ Identify target branch and list all changed/added/deleted files
4. ✅ Review commit titles for context

## Per-File Review (Apply to EACH changed file)

### 1. Structure & Organization

- [ ] File is in correct directory following feature-based organization
- [ ] File name follows `snake_case` naming convention
- [ ] File responsibility is clear and single-purpose
- [ ] Reason for change/addition is understandable

### 2. Code Quality

- [ ] Code is readable with descriptive names (variables, functions, classes)
- [ ] Naming is consistent with project conventions
- [ ] Logic is correct with no obvious errors
- [ ] Edge cases are handled appropriately
- [ ] Code is modular without unnecessary duplication

### 3. Error Handling

- [ ] Errors and exceptions are handled appropriately
- [ ] Uses `ApiResult` pattern (not raw exceptions)
- [ ] Error messages are user-friendly and localized
- [ ] No silent failures or swallowed exceptions

### 4. Security

- [ ] Input validation is present where needed
- [ ] No secrets, API keys, or tokens hardcoded
- [ ] Sensitive data is properly secured (using CacheHelper.setSecuredString)
- [ ] SQL injection/XSS vulnerabilities checked (if applicable)

### 5. Performance

- [ ] No obvious performance issues or inefficiencies
- [ ] Heavy operations not in build() methods
- [ ] Pagination used for large lists
- [ ] const constructors used where possible
- [ ] Controllers are properly disposed

### 6. Documentation

- [ ] Public APIs have doc comments (///)
- [ ] Complex logic is documented
- [ ] New modules have explanatory comments
- [ ] Code documents "why" not just "what"

### 7. Testing

- [ ] Sufficient test coverage for new/changed logic
- [ ] Tests can actually fail (not just mocking)
- [ ] Tests follow AAA pattern (Arrange, Act, Assert)
- [ ] All tests pass in CI

### 8. Project Standards

- [ ] Follows project architecture (data/domain/presentation)
- [ ] Uses feature-specific API service files
- [ ] Uses ApiResult<T> for repository returns
- [ ] Uses LocaleKeys.tr() for all strings (no hardcoded text)
- [ ] Uses GetIt for dependency injection
- [ ] Uses Cubit for state management
- [ ] Uses ScreenUtil for responsive sizing (.w, .h, .sp)
- [ ] Uses theme constants (AppColors, AppTextStyles)

### 9. Code Generation

- [ ] Generated files (.g.dart) are up-to-date
- [ ] Generated files are NOT manually edited
- [ ] build_runner was executed after model changes

## Overall Change Set

### Scope & Focus

- [ ] Changes are focused and scoped to stated purpose
- [ ] No unrelated or unnecessary changes included
- [ ] PR/MR description accurately reflects changes

### Testing

- [ ] New tests added for new features
- [ ] Existing tests updated if behavior changed
- [ ] All CI tests pass

### Dependencies

- [ ] New dependencies are registered in DI files
- [ ] Feature-specific DI module created/updated
- [ ] All dependencies properly injected (not instantiated directly)

## Architecture Validation

### Clean Architecture Compliance

- [ ] Data layer changes don't affect presentation directly
- [ ] Presentation uses Cubits/UseCases (not repositories directly)
- [ ] Domain layer is framework-independent (no Flutter imports)
- [ ] Repository implements interface from domain layer

### API Changes

- [ ] New endpoints added to FEATURE-SPECIFIC api_service.dart
- [ ] Request/Response models use @JsonSerializable
- [ ] Models placed in correct directory (features/[name]/data/models/)
- [ ] ApiResult<T> returned from repositories

### State Management

- [ ] Cubit emits: Initial → Loading → Success/Failure
- [ ] States extend Equatable
- [ ] BlocListener used for side effects (navigation, toasts)
- [ ] BlocBuilder used for UI updates
- [ ] buildWhen used to optimize rebuilds

## Review Output Format

```markdown
## Summary

[Brief overview of changes]

## Architecture Review

✅ Clean Architecture: [Compliant/Issues found]
✅ API Pattern: [Correct/Issues found]
✅ State Management: [Correct/Issues found]

## File-by-File Analysis

### [filename.dart]

**Purpose**: [Brief description]
**Issues**:

- [ ] Issue 1: [Description + Suggestion]
- [ ] Issue 2: [Description + Suggestion]

**Recommendations**:

1. [Specific actionable recommendation]
2. [Specific actionable recommendation]

## Critical Issues

[List any blocking issues that must be fixed]

## Suggestions

[List non-blocking improvements]

## Questions/Clarifications

[List anything unclear that needs explanation]
```

## Red Flags 🚩

Stop and flag these immediately:

🚩 Hardcoded strings (not using LocaleKeys.tr())
🚩 Direct repository access from UI (skipping UseCases)
🚩 BuildContext used after async without mounted check
🚩 Controllers/FocusNodes not disposed
🚩 Global API service file used instead of feature-specific
🚩 Either<Failure, T> used instead of ApiResult<T>
🚩 Dio/Flutter imports in domain layer
🚩 Secrets or API keys in code
🚩 Generated files manually edited
🚩 Missing dependency registration in DI files

## Best Practices for Feedback

1. **Be objective and constructive** - No automatic praise, honest feedback
2. **Be specific** - Point to exact lines and provide examples
3. **Explain why** - Don't just say "wrong", explain the impact
4. **Provide solutions** - Include code examples of correct approach
5. **Prioritize** - Critical issues first, nice-to-haves last
6. **Ask questions** - If something is unclear, ask for clarification
7. **Reference docs** - Link to project instructions or official docs

## Investigation Approach

1. Don't assume code is correct - investigate implementation
2. Check how connected components are implemented
3. Look up commit history for context
4. Fetch online documentation if unsure about best practices
5. If still unclear after investigation, note it in review
