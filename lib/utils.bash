#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/bridgecrewio/yor"
TOOL_NAME="yor"
TOOL_TEST="yor --version"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if yor is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
  # Change this function if yor has other means of determining installable versions.
  list_github_tags
}

get_platform() {
  local -r kernel="$(uname -s)"
  if [[ $OSTYPE == "msys" || $kernel == "CYGWIN"* || $kernel == "MINGW"* ]]; then
    echo windows
  else
    uname | tr '[:upper:]' '[:lower:]'
  fi
}

get_arch() {
  local -r machine="$(uname -m)"
  OVERWRITE_ARCH=${ASDF_HASHICORP_OVERWRITE_ARCH:-"false"}
  if [[ $OVERWRITE_ARCH != "false" ]]; then
    echo "$OVERWRITE_ARCH"
  elif [[ $machine == "arm64" ]] || [[ $machine == "aarch64" ]]; then
    echo "arm64"
  elif [[ $machine == *"arm"* ]] || [[ $machine == *"aarch"* ]]; then
    echo "arm"
  elif [[ $machine == *"386"* ]]; then
    echo "386"
  else
    echo "amd64"
  fi
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  local -r platform="$(get_platform)"
  local -r arch="$(get_arch)"

  url="$GH_REPO/releases/download/${version}/yor_${version}_${platform}_${arch}.tar.gz"

  echo "* Downloading $TOOL_NAME release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"/bin
    cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"/bin
    chmod +x $install_path/bin/yor

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
