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
        fileTreeHash = "sha256-pj/B9uC9VHwm4E9Ba3VwBY38zOW55OU4EGMe1KM8HbU=";
      };
    in
    {
      packages.${_model_.pname} = model;
    };
}
