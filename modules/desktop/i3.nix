{ config, lib, pkgs, dotfiles, ... }:
let
  mod = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
    };

  };

  xdg.configFile.i3.source = "${dotfiles}/i3";
}
