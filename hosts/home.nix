{ config, lib, pkgs, admin, ... }:
{
  home = {
    username = "${admin}";
    homeDirectory = lib.mkDefault "/home/${admin}";
  };

  programs.home-manager = {
    enable = true;
  };

  # DO NOT TOUCH THIS
  home.stateVersion = "22.11";
}
