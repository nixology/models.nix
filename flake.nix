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

  inputs.yujiepan--qwen2_5-tiny-random.url = "git+https://huggingface.co/yujiepan/qwen2.5-tiny-random";
  inputs.yujiepan--qwen2_5-tiny-random.flake = false;

  inputs.Qwen--Qwen2_5-0_5B.url = "git+https://huggingface.co/Qwen/Qwen2.5-0.5B";
  inputs.Qwen--Qwen2_5-0_5B.flake = false;

  inputs.Qwen--Qwen2_5-1_5B-Instruct.url = "git+https://huggingface.co/Qwen/Qwen2.5-1.5B-Instruct";
  inputs.Qwen--Qwen2_5-1_5B-Instruct.flake = false;

  inputs.yujiepan--qwen3-tiny-random.url = "git+https://huggingface.co/yujiepan/qwen3-tiny-random";
  inputs.yujiepan--qwen3-tiny-random.flake = false;

  inputs.Qwen--Qwen3-0_6B.url = "git+https://huggingface.co/Qwen/Qwen3-0.6B";
  inputs.Qwen--Qwen3-0_6B.flake = false;

  inputs.yujiepan--mistral-v0_3-tiny-random.url = "git+https://huggingface.co/yujiepan/mistral-v0.3-tiny-random";
  inputs.yujiepan--mistral-v0_3-tiny-random.flake = false;

  outputs =
    inputs: with inputs.flake.lib; mkFlake { inherit inputs; } { imports = modulesIn ./modules; };
}
