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
          config.packages.yujiepan--qwen2_5-tiny-random
          config.packages.Qwen--Qwen2_5-0_5B
          config.packages.Qwen--Qwen2_5-1_5B-Instruct
          config.packages.yujiepan--qwen3-tiny-random
          config.packages.Qwen--Qwen3-0_6B
          config.packages.yujiepan--mistral-v0_3-tiny-random
        ];
      };
    in
    {
      packages = { inherit cache; };
    };
}
