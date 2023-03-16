{ nixpkgs, home-manager, name, ... }:
let
  system = "x86_64-linux";

  config = {
    networking.hostName = name;
    nixpkgs.hostPlatform = nixpkgs.lib.mkDefault system;
  };

in {
  pkgs = nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };

  modules = [
    ./../base_config.nix
    ./config.nix 
    ./hardware.nix

    { inherit config; }
  ];
}
