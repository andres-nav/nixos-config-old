{ config, pkgs, ... }:
{
    home = {
      username = "vm";
      homeDirectory = pkgs.lib.mkDefault "/home/vm";

      packages = with pkgs; [
        htop
      ];


    };

    programs = {
      home-manager.enable = true;
    };

    home.stateVersion = "22.11";
}
