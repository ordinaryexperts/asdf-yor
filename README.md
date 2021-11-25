<div align="center">

# asdf-yor


[![Build](https://github.com/jmcvetta/asdf-yor/actions/workflows/build.yml/badge.svg)](https://github.com/jmcvetta/asdf-yor/actions/workflows/build.yml) [![Lint](https://github.com/jmcvetta/asdf-yor/actions/workflows/lint.yml/badge.svg)](https://github.com/jmcvetta/asdf-yor/actions/workflows/lint.yml)


[yor](https://yor.io) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add yor
# or
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

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/jmcvetta/asdf-yor/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Jason McVetta](https://github.com/jmcvetta/)
