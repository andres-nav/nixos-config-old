{ nixpkgs, home-manager, ...}:
let
  commonInherits = {
    inherit nixpkgs home-manager;
  };

  hosts = builtins.mapAttrs (hostname: value: import (./. + "/${hostname}") { inherit nixpkgs home-manager hostname; }) 
    (nixpkgs.lib.attrsets.filterAttrs (name: type: type == "directory") (builtins.readDir ./.));

in 
  builtins.mapAttrs (name: attrs: (nixpkgs.lib.nixosSystem {
    inherit (attrs) system modules specialArgs;
  })) hosts
