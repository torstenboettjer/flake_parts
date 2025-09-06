# flake.nix "flake" "imports"
{
  inputs = {
    nixpkgs.url = "nixpkgs";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # Development

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, devshell }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" ];

    imports = [
      ./modules/nodejs-packages.nix
      ./modules/nodejs-devshell.nix
    ];

    flake = {
      # your existing definitions before using flake-parts...
    };
  };
}
