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
        fileTreeHash = "sha256-2Ri61t7kTHRjdlw1dDObD92gG2qfAjJlgynRVpKMyzk=";
      };
    in
    {
      packages.${_model_.pname} = model;
    };
}
