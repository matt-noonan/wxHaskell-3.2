wxHaskell
=========

[wxWidgets](https://www.wxwidgets.org/) wrapper for Haskell

Status
------

Builds against: [wxWidgets](https://www.wxwidgets.org/) 3.2

Build & installation
--------------------

1. Install [wxWidgets](https://wxwidgets.org/).
2. Install [`wxc`](./wxc).
   * [shell.nix](./shell.nix) provides a [Nix](https://nixos.org) shell
     with the `wxc` package and all other native dependencies.
3. Use the `wx` and/or `wxcore` like any other cabal packages,
   for example by putting them in `build-depends`.
   There are samples in this repo that you can run with `cabal run`.
   You can get a list of samples by running `cabal run all`.

See also <https://wiki.haskell.org/WxHaskell>.
