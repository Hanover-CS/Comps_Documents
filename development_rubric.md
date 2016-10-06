# Software Development Proficiency

Each level of achievement builds on the previous level, from left to right.

| Proficiencies   | Below Expectations       | Meets Most Expectations        | Exceeds Expectations       |
| :---			  | :-- 					 | :-- 						      | :-- 					   |
| Project Structure     | The code is thrown together in just a few large files. | The code is decomposed into manageable modules/classes. | Project as a whole is organized in a sensible file structure. |
| Code Modularity | Code is barely decomposed into modules/classes | Code is properly modular and the modules/classes have clearly-specified roles and responsibilities. | The inter-module interactions and module interaces are clearly specified. |
| Version Control | Few commits are made, often addressing multiple concerns (not atomic). | Each commit addresses just one project concern (atomic). | Each commit message succinctly describes the purpose of the commit. |
| Issue Management | Few issues are made, with limited comments, labels and milestones. | Uses issues to organize the work including labels and helpful comments. | Issues are linked to commits via the commit messages, and milestones are used to further organize the work. |










## Modular Overall Design

- project has the right modules/classes
- the modules have clearly-specified roles, properties, and responsibilities
- the inter-module interactions and module interaces are clearly described
- modules/classes are distributed in a sensible file structure

## Project Management Process

 - uses commits in an organized way to document the development of the project, including linking commits to issues and having "atomic" (well-focused) commits
 - uses issues effectively, including milestones, descriptive labels, and helpful comments

## Readable Code

- has clear and consistent naming, which creates "self-documenting" code where possible
- has clear and consistent indenting and spacing
- uses consistent logic patterns for control flow
- has in-code comments where needed for clarity (not excessive)
- provides compilable documentation at the function and module levels
- documents the coding conventions being used (linter config rules)

## Maintainable Code

- code is DRY (don't repeat yourself)
- avoids poor syntactic constructs, like "if (x == true)", assignment within an "if" statement, omitting enclosing braces for a 1-line block of code, etc.
- uses functional decomposition to keep function definitions short and clear (atomic functions)
- has automated unit testing code for public functions (edge cases and a typical case)
- as much as possible, has automated "integration" testing for user functionalities
- any data resources are stored in a suitable data format and separated from the business logic of the project


## Summary Documentation

- provides installation instructions (in ReadMe on GitHub, or in a webpage for showcasing the project)
- provides a user's guide: how does one use the application?
- provides a compiled version of the function/module adocumentation (.html or .pdf, etc.)
