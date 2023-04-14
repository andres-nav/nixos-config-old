{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-22.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      url = "github:andres-nav/dotfiles";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, dotfiles, ... } @ inputs: 
  let
    hosts = builtins.mapAttrs (hostname: value: import (./hosts + "/${hostname}") { inherit nixpkgs home-manager dotfiles hostname; })
      (nixpkgs.lib.attrsets.filterAttrs (name: type: type == "directory") (builtins.readDir ./hosts));

  in {
    nixosConfigurations = builtins.mapAttrs (name: attrs: (nixpkgs.lib.nixosSystem {
      inherit (attrs) system modules specialArgs;
    })) hosts;
  };
}
