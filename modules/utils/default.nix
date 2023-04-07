{ config, lib, pkgs, dotfiles, ... }:
{
  xdg.configFile.bin.source = "${dotfiles}/bin";
}
