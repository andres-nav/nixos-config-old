{ config, lib, pkgs, inputs, admin, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Madrid";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkDefault "us";
    useXkbConfig = true; 
  };

  services = {
    xserver = {
      layout = "us";
      xkbOptions = "caps:swapescape,ctrl:swap_lalt_lctl";
    };
  };

  programs = {
    fish.enable = true;
  };

  users.defaultUserShell = pkgs.fish;

  users.users."${admin}" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    git
    htop
  ];

  services.openssh.enable = true;


  # DO NOT TOUCH THIS
  system.stateVersion = "22.11";
}
