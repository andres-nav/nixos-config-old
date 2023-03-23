{ config, lib, pkgs, inputs, user, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkDefault "us";
    useXkbConfig = true; 
  };

  # DO NOT TOUCH THIS
  system.stateVersion = "22.11";
}
