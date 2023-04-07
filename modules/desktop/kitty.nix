{ config, lib, pkgs, dotfiles, ... }:
{
  programs.kitty.enable = true;

  xdg.configFile.kitty.source = "${dotfiles}/kitty";
}
