{ config, lib, pkgs, dotfiles, ... }:
{
  programs.rofi.enable = true;

  xdg.configFile.rofi.source = "${dotfiles}/rofi";
}
