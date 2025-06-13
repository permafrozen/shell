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
    inputs@{ flake-parts, quickshell, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem =
        {
          pkgs,
          system,
          ...
        }:
        let

          quickshell-pkg = quickshell.packages.${system}.default;
        in
        {
          packages.default = pkgs.hello;
          # QML-Imports don't work if installed in a shell

          # devShells.default = pkgs.mkShell {
          #   packages = [
          #     quickshell-pkg
          #     pkgs.qt6.qtdeclarative
          #   ];
          # };
        };
    };
}
