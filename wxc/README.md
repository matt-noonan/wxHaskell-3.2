# wxc

**`wxc`** is a C language binding for [wxWidgets](https://www.wxwidgets.org/).
It is needed because the Haskell FFI can only bind to C as it does not understand C++ name mangling.
Because it is a C language wrapper over wxWidgets, and is generated as a standard dynamic library on all supported platforms, wxc could be used as the basis for a wxWidgets wrapper for any language which supports linking to C (so that would be all of them then).
In older versions of wxHaskell, the wxc components were built as a monolithic static library with wxcore.

It was originally derived from the [wxEiffel](http://elj.sourceforge.net/projects/gui/ewxw/) binding.

## Installation

### Distro packages

`wxc` may be provided by your distribution.
In that case, you should try installing it from there first.

[![Packaging status](https://repology.org/badge/vertical-allrepos/wxc.svg)](https://repology.org/project/wxc/versions)

A [Nix](https://nixos.org) package is also provided: [package.nix](./package.nix), [default.nix](./default.nix).

### Installing from source

Prerequisites: wxWidgets, CMake

Build the package:

```sh
./generate-version-header.sh
mkdir build
cd build
cmake ..
cmake --build .
```

Install:

```sh
cmake --install .
```
