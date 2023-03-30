{ config, lib, pkgs, admin, ... }:
{
  home = {
    username = "${admin}";
    homeDirectory = lib.mkDefault "/home/${admin}";

  };

  programs.emacs = {
    enable = true;
  };

    
  # Let Home Manager install and manage itself
  programs.home-manager = {
    enable = true;
  };

  home.stateVersion = "22.11";
}
 
