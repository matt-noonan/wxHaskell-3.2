{ compiler }:

final: prev: {
  haskell = prev.haskell // {
    packages = prev.haskell.packages // {
      "${compiler}" = prev.haskell.packages."${compiler}".override
        (old: {
          overrides = final.lib.fold final.lib.composeExtensions
            (old.overrides or (_: _: { })) [
            (hfinal: hprev:
              {
                wxc = null;
                wxdirect = hfinal.callCabal2nix "wxdirect" ../wxdirect { };
                wxcore = final.haskell.lib.compose.overrideCabal { __propagatePkgConfigDepends = false; } (hfinal.callCabal2nix "wxcore" ../wxcore { wxGTK = final.wxGTK32; wxc = final.wxc; });
                wx = hfinal.callCabal2nix "wx" ../wx { };
                samplesWxcore = hfinal.callCabal2nix "samplesWxcore" ../samples/wxcore { };
                samplesWx = hfinal.callCabal2nix "samplesWx" ../samples/wx { };
              })
          ];
        });
    };
  };
}
