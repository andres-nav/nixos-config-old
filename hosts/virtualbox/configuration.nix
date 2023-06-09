{ config, lib, pkgs, inputs, admin, ... }:
{
  virtualisation.virtualbox.guest.enable = true; 
  virtualisation.virtualbox.guest.x11 = true;

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # run VBoxClient -fv --vmsvga
}

