{ nixpkgs, home-manager, ... }:
let
  system = "x86_64-linux";

in {
  pkgs = nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };

  modules = [
    ./config.nix
  ];
}
