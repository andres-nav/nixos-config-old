{ config, lib, pkgs, ... }:
let
  mod = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

    };
  };

  programs.i3status = {
    enable = true;

    modules = {
      "volume master" = {
        position = 1;
	settings = {
	  format = "vol %volume";
	  format_muted = "mut (%volume)";
	  device = "pulse:1";
	};
      };
    };
  };
}
