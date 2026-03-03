Code Review Ruleset for LLMs
Check that the current branch is a feature, bugfix, or PR/MR branch and not a main or develop branch.
Verify the branch is up-to-date with the target branch (main).
Identify the target branch for the merge and list all files that have changed, been added, or deleted.
For every change, look up the commit title and review how any connected components are implemented.
Do not assume a change or fix is correct without investigating the implementation details.
Avoid complimenting or critiquing by default; be as objective and reasonable as possible. Instead of offering automatic praise, take a devil's advocate approach and give honest, thoughtful feedback.
If the change or fix remains difficult to understand after several attempts, include this in your report.
Fetch online documentation if you're unsure about the best practices for a particular package or library.
For each changed file, check that the file is in the correct directory.
For each changed file, check that the file name follows naming conventions.
For each changed file, verify the file's responsibility is clear and that the reason for its change or addition is understandable.
For each changed file, review the code for readability and ensure variable, function, and class names are descriptive and consistent.
For each changed file, check the logic and correctness of the code, ensuring there are no logic errors or missing edge cases.
For each changed file, check that the code is modular and does not contain unnecessary duplication (maintainability).
For each changed file, ensure errors and exceptions are handled appropriately.
For each changed file, check for potential security concerns such as input validation and secrets in code.
For each changed file, check for obvious performance issues or inefficiencies.
For each changed file, verify that public APIs, complex logic, and new modules are documented.
For each changed file, ensure there is sufficient test coverage for new or changed logic.
For each changed file, ensure the code matches the project's style guide and coding patterns.
For generated files, confirm they are up-to-date and not manually edited.
Check that the overall change set is focused and scoped to the stated purpose and does not include unrelated or unnecessary changes.
Verify that the PR/MR description accurately reflects the changes made.
Ensure there are new or updated tests covering new or changed logic.
If there's a test, always evaluate whether the test could fail or if it's only checking a mock implementation.
Ensure all tests pass in the continuous integration system.
Provide clear, constructive feedback for any issues found, including suggestions for improvement and requests for clarification if anything is unclear.
The expected output is an answer in the chat, mentioning conclusions and recommendations per file.