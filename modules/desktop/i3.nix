{ config, lib, pkgs, ... }:
{
  xsession.windowManager.i3.enable = true;

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
