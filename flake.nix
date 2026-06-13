{
  description = "Huggingface models";

  inputs.flake.url = "github:nixology/flake.nix";

  #inputs.nix-hug.url = "github:longregen/nix-hug";
  inputs.nix-hug.url = "github:marksisson/nix-hug/use-nixpkgs-fetchurl";
  inputs.nix-hug.inputs.nixpkgs.follows = "flake/core/nixpkgs";

  inputs.unsloth--Qwen3_6-27B-MLX-8bit.url = "git+https://huggingface.co/unsloth/Qwen3.6-27B-MLX-8bit";
  inputs.unsloth--Qwen3_6-27B-MLX-8bit.flake = false;

  inputs.unsloth--Qwen3_6-35B-A3B-MLX-8bit.url = "git+https://huggingface.co/unsloth/Qwen3.6-35B-A3b-MLX-8bit";
  inputs.unsloth--Qwen3_6-35B-A3B-MLX-8bit.flake = false;

  outputs =
    inputs: with inputs.flake.lib; mkFlake { inherit inputs; } { imports = modulesIn ./modules; };
}
