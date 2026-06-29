{ inputs, ... }:
let
  flakeLib = inputs.flake.lib;
  _model_ = flakeLib.metadataForFlakeInput inputs.self inputs.${flakeLib.getFileStem __curPos.file};
in
{
  perSystem =
    { system, ... }:
    let
      nix-hug-lib = inputs.nix-hug.lib.${system};

      model = nix-hug-lib.fetchModel {
        inherit (_model_) url rev;
        fileTreeHash = "sha256-4lO1g4FMSiMslIKqcbKmJDRfKtggZ55KbnIUSLjuIug=";
      };
    in
    {
      packages.${_model_.pname} = model;
    };
}
