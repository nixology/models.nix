{ inputs, ... }:
let
  flakeLib = inputs.flake.lib;
  _model_ = flakeLib.metadataForFlakeInput inputs.self inputs.${flakeLib.getFileName __curPos};
in
{
  perSystem =
    { system, ... }:
    let
      nix-hug-lib = inputs.nix-hug.lib.${system};

      model = nix-hug-lib.fetchModel {
        inherit (_model_) url rev;
        fileTreeHash = "sha256-HBLPaASKtq0dN0BLUExLYGR1bvTTUVyT76sIzlLj868=";
      };
    in
    {
      packages.${_model_.pname} = model;
    };
}
