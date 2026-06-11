ShellCheck fixes applied
Trigger workflow rerun

# Secure Cache Cleaner Pipeline

This repository demonstrates a small shell-based cache cleanup utility wrapped in a secure CI/CD pipeline using GitHub Actions.

The application itself is intentionally simple. The focus of this repository is the pipeline: testing, linting/security scanning, container image building, image scanning, and deployment to the GitHub Container Registry.

## Application Overview

`clear_cache.sh` is a basic cache cleanup script. It prompts the user for confirmation before running and is designed as a lightweight example of an operations automation script.

## Repository Structure

```text
.
├── clear_cache.sh
├── test_clear_cache.sh
├── tests/
│   └── test_clear_cache.sh
├── Dockerfile
├── README.md
└── .github/
    └── workflows/
        └── ci-cd.yml
