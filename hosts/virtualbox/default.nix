{ nixpkgs, home-manager, name, ... }:
let
  system = "x86_64-linux";

  config = {
    networking.hostName = name;
  };

in {
  pkgs = nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };

  modules = [
    ./config.nix 
    ./hardware.nix

    { inherit config; }
  ];
}
