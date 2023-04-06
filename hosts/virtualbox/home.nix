{ config, lib, pkgs, admin, ... }:
let 
  modulesPath = ./../../modules;
in {
  imports = [
    "${modulesPath}/editors/emacs.nix"
    "${modulesPath}/editors/neovim.nix"

    "${modulesPath}/browsers/firefox.nix"

    "${modulesPath}/desktop/i3.nix"
    "${modulesPath}/desktop/rofi.nix"

    "${modulesPath}/shell/kitty.nix"
  ];

}
 
