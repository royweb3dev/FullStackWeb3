# Day 04: Git Branching and Workflow

## Objective

To understand and implement the professional Git branching workflow. This practice is fundamental for isolating new work, ensuring the stability of the main codebase, and enabling collaborative development.

## Core Concept: Why Branch?

Working directly on the `main` branch is a high-risk practice in any serious project. Any in-progress or broken code could destabilize the entire project. Branching provides a solution by creating an isolated environment.

-   **`main` Branch:** This branch is considered the definitive, stable, and production-ready version of the codebase. It should always be functional.
-   **Feature Branch (e.g., `feature/add-new-section`):** This is a temporary, disposable copy of the `main` branch where new features, bug fixes, or experiments are developed. Work done here does not affect `main` until it is complete, tested, and ready to be merged.

This workflow ensures safety, organization, and allows multiple features to be developed in parallel without conflict.

## Implemented Workflow

The professional branching workflow was practiced by adding a new "My Philosophy" section to the portfolio. The exact steps were:

1.  **Create & Switch:** A new branch was created from `main` to house the new feature.
    -   `git switch -c feature/add-philosophy-section`

2.  **Work & Commit:** The new `<section>` was added to `index.html` and the changes were committed to the feature branch.
    -   `git add .`
    -   `git commit -m "feat: add philosophy section"`

3.  **Switch Back to Main:** Returned to the stable `main` branch.
    -   `git switch main`

4.  **Merge:** The completed work from the feature branch was integrated into `main`.
    -   `git merge feature/add-philosophy-section`

5.  **Clean Up:** The temporary feature branch, having served its purpose, was deleted.
    -   `git branch -d feature/add-philosophy-section`

## Result

The `index.html` file on the `main` branch now successfully includes the new "My Philosophy" section. The entire process was executed safely, demonstrating the power of branching to protect the integrity of the main codebase while allowing for new development.
