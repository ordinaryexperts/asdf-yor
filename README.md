<div align="center">

# asdf-yor

[Yor](https://yor.io) plugin for the [asdf version manager](https://asdf-vm.com).

[![Build](https://github.com/jmcvetta/asdf-yor/actions/workflows/build.yml/badge.svg)](https://github.com/jmcvetta/asdf-yor/actions/workflows/build.yml) [![Lint](https://github.com/jmcvetta/asdf-yor/actions/workflows/lint.yml/badge.svg)](https://github.com/jmcvetta/asdf-yor/actions/workflows/lint.yml)

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.


# Install

Plugin:

```shell
asdf plugin add yor https://github.com/jmcvetta/asdf-yor.git
```

yor:

```shell
# Show all installable versions
asdf list-all yor

# Install specific version
asdf install yor latest

# Set a version globally (on your ~/.tool-versions file)
asdf global yor latest

# Now yor commands are available
yor --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.


# Contributing

[![semantic-release: conventionalcommits](https://img.shields.io/badge/semantic--release-conventionalcommits-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/jmcvetta/asdf-yor/graphs/contributors)!

Releases are generated automatically based on commit messages, using [`semantic-release`](https://github.com/semantic-release/semantic-release). Commit messages must follow the [Conventional Commits](https://www.conventionalcommits.org/) standard.


# License

See [LICENSE](LICENSE) © [Jason McVetta](https://github.com/jmcvetta/)
