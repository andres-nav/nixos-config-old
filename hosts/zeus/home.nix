{ config, lib, pkgs, dotfiles, admin, ... }:
let 
  modulesPath = ./../../modules;
in {
  imports = [
    "${modulesPath}/utils"
    "${modulesPath}/utils/git.nix"

    "${modulesPath}/editors/emacs.nix"
    "${modulesPath}/editors/neovim.nix"

    "${modulesPath}/browsers/firefox.nix"

    "${modulesPath}/desktop/i3.nix"
    "${modulesPath}/desktop/rofi.nix"
    "${modulesPath}/desktop/kitty.nix"
  ];

  home.packages = with pkgs; [
    tmux
    lazygit
  ];
}
 
