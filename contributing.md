# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test yor https://github.com/ordinaryexperts/asdf-yor.git "yor --version"
```

Tests are automatically run in GitHub Actions on push and PR.

Releases are generated automatically based on commit messages, using [`semantic-release`](https://github.com/semantic-release/semantic-release). Commit messages must follow the [Conventional Commits](https://www.conventionalcommits.org/) standard.
