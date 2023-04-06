{ config, lib, pkgs, admin, ... }:
let 
  modulesPath = ./../../modules;
in {
  imports = [
    "${modulesPath}/editors/emacs.nix"
  ];

}
 
