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
        fileTreeHash = "sha256:0b5pkkic4q5rb58zv2zm229b0lih4kss2q7939d3fxj2h2a8glyp";
      };
    in
    {
      packages.${_model_.pname} = model;
    };
}
