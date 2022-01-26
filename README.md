# Git pre-commit hook for use with terraform repositories and checkov

## Usage

### Dependencies:
```
pre-commit
checkov
```

### Setup

1. Install pre-commit with your repository with `pre-commit install`
2. Create or amend the `.pre-commit-config.yaml` file in the root of your repository
3. Add in configuration for this hook within the `repos` block, eg:

```
repos:
- repo: https://github.com/miscreancy/pre-commit-checkov
  rev: v0.0.1
  hooks:
    - id: checkov
```

### Arguments

This takes any argument you hand it, and passes them to checkov.

Without any arguments passed, this will run `checkov` against changed `\.tf$` files only; this can be overridden by providing the arguments "-d ." to scan the whole repository.

It is recommended to run this with the `--quiet` argument passed, as below:
```
repos:
- repo: https://github.com/miscreancy/pre-commit-checkov
  rev: v0.0.1
  hooks:
    - id: checkov
      args: "--quiet"
```

## Contributing

Please feel free to PR and I will review. Similarly, any issues, please create a GH issue to track it.
