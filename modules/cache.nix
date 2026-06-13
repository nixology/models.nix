{ inputs, ... }:
{
  perSystem =
    { config, system, ... }:
    let
      nix-hug-lib = inputs.nix-hug.lib.${system};

      cache = nix-hug-lib.buildCache {
        models = [
          config.packages.unsloth--Qwen3_6-27B-MLX-8bit
          config.packages.unsloth--Qwen3_6-35B-A3B-MLX-8bit
        ];
      };
    in
    {
      packages = { inherit cache; };
    };
}
