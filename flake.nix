{
  description = "Flake for building wxHaskell";

  inputs.nixpkgs.follows = "nixpkgs-2411";
  inputs.nixpkgs-2411.url = "github:NixOS/nixpkgs/release-24.11";

  outputs = { self, nixpkgs, ... }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      # keep it simple (from https://ayats.org/blog/no-flake-utils/)
      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system:
          f (import nixpkgs {
            inherit system;
            overlays = [
              (final: prev: { wxc = prev.wxc.overrideAttrs (_: { src = ./wxc; sourceRoot = null; }); })
              (import ./nix/haskell-overlay.nix { compiler = "ghc910"; })
              (import ./nix/haskell-overlay.nix { compiler = "ghc983"; })
              (import ./nix/haskell-overlay.nix { compiler = "ghc966"; })
            ];
          }));

    in
    {
      packages = forAllSystems (pkgs:
        {
          default = pkgs.haskell.packages.ghc983.samplesWx;
          ghc910 = pkgs.haskell.packages.ghc910.samplesWx;
          ghc983 = pkgs.haskell.packages.ghc983.samplesWx;
          ghc966 = pkgs.haskell.packages.ghc966.samplesWx;
        });
    };

  nixConfig = {
    allow-import-from-derivation = "true";
  };
}
