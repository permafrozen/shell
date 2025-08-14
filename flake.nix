{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem =
        { pkgs, system, ... }:
        {
          packages.default = pkgs.callPackage ./nix/package.nix {
            quickshell = inputs.quickshell.packages.${system}.default;
          };
          devShells.default = pkgs.callPackage ./nix/shell.nix {
            quickshell = inputs.quickshell.packages.${system}.default;
          };
        };
    };
}
