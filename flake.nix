{
  description = "21ideas";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    systems.url = "github:nix-systems/default";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixpkgs-stable.follows = "nixpkgs";
        flake-compat.follows = "flake-compat";
        flake-utils.follows = "flake-utils";
        gitignore.follows = "gitignore";
      };
    };
    blank.url = "github:divnix/blank";
    devenv = {
      url = "github:cachix/devenv";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "flake-compat";
        pre-commit-hooks.follows = "pre-commit-hooks";
        nix.follows = "blank";
      };
    };
    nix2container = {
      url = "github:nlewo/nix2container";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
    mk-shell-bin.url = "github:rrbutani/nix-mk-shell-bin";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    flake-parts,
    treefmt-nix,
    devenv,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        treefmt-nix.flakeModule
        devenv.flakeModule
      ];
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      perSystem = {
        config,
        pkgs,
        ...
      }: let
        ruby = pkgs.ruby_3_1;
        gems = pkgs.bundlerEnv {
          name = "gems";
          inherit ruby;
          gemfile = ./Gemfile;
          lockfile = ./Gemfile.lock;
          gemset = ./gemset.nix;
        };
      in {
        treefmt = {
          projectRootFile = "flake.nix";
          programs.alejandra.enable = true;
        };
        devenv.shells.default = {
          name = "21ideas";
          languages = {
            nix.enable = true;
            ruby = {
              enable = true;
              package = ruby;
            };
          };
          packages = [
            config.treefmt.build.wrapper
            pkgs.bundix
            gems
          ];
          starship.enable = true;
          difftastic.enable = true;
          pre-commit = {
            hooks = {
              nil.enable = true;
              statix.enable = true;
              deadnix.enable = true;
              treefmt.enable = true;
            };
            settings.treefmt.package = config.treefmt.build.wrapper;
          };
        };
      };
    };
}
