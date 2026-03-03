# Code Review Ruleset for LLMs

1. **Check branch type:** Verify that the current branch is a feature, bugfix, or PR/MR branch and *not* a main or develop branch.
2. **Sync status:** Verify the branch is up-to-date with the target branch (main).
3. **Identify changes:** Identify the target branch for the merge and list all files that have changed, been added, or deleted.
4. **Contextual review:** For every change, look up the commit title and review how any connected components are implemented.
5. **Verify implementation:** Do not assume a change or fix is correct without investigating the implementation details.
6. **Objective feedback:** Avoid complimenting or critiquing by default; be as objective and reasonable as possible. Instead of offering automatic praise, take a devil's advocate approach and give honest, thoughtful feedback.
7. **Flag complexity:** If the change or fix remains difficult to understand after several attempts, include this in your report.
8. **Consult documentation:** Fetch online documentation if you're unsure about the best practices for a particular package or library.
9. **Directory structure:** For each changed file, check that the file is in the correct directory.
10. **Naming conventions:** For each changed file, check that the file name follows naming conventions.
11. **Single responsibility:** For each changed file, verify the file's responsibility is clear and that the reason for its change or addition is understandable.
12. **Readability:** For each changed file, review the code for readability and ensure variable, function, and class names are descriptive and consistent.
13. **Logic and correctness:** For each changed file, check the logic and correctness of the code, ensuring there are no logic errors or missing edge cases.
14. **Maintainability:** For each changed file, check that the code is modular and does not contain unnecessary duplication.
15. **Error handling:** For each changed file, ensure errors and exceptions are handled appropriately.
16. **Security checks:** For each changed file, check for potential security concerns such as input validation and secrets in code.
17. **Performance:** For each changed file, check for obvious performance issues or inefficiencies.
18. **Documentation:** For each changed file, verify that public APIs, complex logic, and new modules are documented.
19. **Test coverage:** For each changed file, ensure there is sufficient test coverage for new or changed logic.
20. **Style guide:** For each changed file, ensure the code matches the project's style guide and coding patterns.
21. **Generated files:** For generated files, confirm they are up-to-date and not manually edited.
22. **Scope check:** Check that the overall change set is focused and scoped to the stated purpose and does not include unrelated or unnecessary changes.
23. **Description accuracy:** Verify that the PR/MR description accurately reflects the changes made.
24. **Test updates:** Ensure there are new or updated tests covering new or changed logic.
25. **Test validity:** If there's a test, always evaluate whether the test could fail or if it's only checking a mock implementation.
26. **CI pass:** Ensure all tests pass in the continuous integration system.
27. **Constructive feedback:** Provide clear, constructive feedback for any issues found, including suggestions for improvement and requests for clarification if anything is unclear.
28. **Expected output format:** The expected output is an answer in the chat, mentioning conclusions and recommendations per file.