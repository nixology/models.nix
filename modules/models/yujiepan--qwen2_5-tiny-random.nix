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
        fileTreeHash = "sha256-Qwfk1ugZ6mRoM3vozWYobs5pU/MjN89X8BFVs1u97Jc=";
      };
    in
    {
      packages.${_model_.pname} = model;
    };
}
