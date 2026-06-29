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
        fileTreeHash = "sha256-eEDwAh8EPqW7sUG+H4JqwI7OCFmRnrl6dUYBbgU7F8Q=";
      };
    in
    {
      packages.${_model_.pname} = model;
    };
}
