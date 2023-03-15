{ nixpkgs, home-manager, ...}:
let
  hosts = builtins.mapAttrs (name: value: import (./. + "/${name}") { inherit nixpkgs home-manager name; }) 
    (nixpkgs.lib.attrsets.filterAttrs (name: type: type == "directory") (builtins.readDir ./.));

  commonInherits = {
    inherit nixpkgs home-manager;
  };
in 
  builtins.mapAttrs (name: attrs: (nixpkgs.lib.nixosSystem {
    inherit (attrs) system modules;
  })) hosts
