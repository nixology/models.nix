{
  perSystem =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      default = {
        mkShellOverrides = {
          stdenv = pkgs.stdenvNoCC;
        };

        packages = [
          (pkgs.python3.withPackages (
            ps: with ps; [
              huggingface-hub
            ]
          ))
        ];
      };
    in
    {
      shellEnvs.default =
        with config.shellEnvs;
        lib.mkMerge [
          default
          nix
        ];
    };
}
