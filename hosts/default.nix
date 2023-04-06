{ nixpkgs, home-manager, dotfiles, ...}:
let
  commonInherits = {
    inherit nixpkgs home-manager dotfiles;
  };

  hosts = builtins.mapAttrs (hostname: value: import (./. + "/${hostname}") { inherit nixpkgs home-manager dotfiles hostname; }) 
    (nixpkgs.lib.attrsets.filterAttrs (name: type: type == "directory") (builtins.readDir ./.));

in 
  builtins.mapAttrs (name: attrs: (nixpkgs.lib.nixosSystem {
    inherit (attrs) system modules specialArgs;
  })) hosts
