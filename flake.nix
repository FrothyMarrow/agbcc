{
  description = "GCC reworked to match games compiled for the Game Boy Advance";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "aarch64-darwin";

    pkgs = import nixpkgs {
      inherit system;
    };

    agbcc = pkgs.callPackage ./nix/build.nix {};
  in {
    packages.${system} = {
      default = agbcc;
      agbcc = agbcc;
    };

    formatter.${system} = pkgs.alejandra;
  };
}
