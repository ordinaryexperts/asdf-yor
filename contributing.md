# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test yor https://github.com/jmcvetta/asdf-yor.git "yor --version"
```

Tests are automatically run in GitHub Actions on push and PR.
