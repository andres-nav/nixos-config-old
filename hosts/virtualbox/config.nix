{ config, lib, pkgs, inputs, user, ... }:
{
  time.timeZone = "Europe/Madrid";

  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      layout = "us";
      xkbOptions = "caps:swapescape,ctrl:swap_lalt_lctl";
    };
  };

  virtualisation.virtualbox.guest.enable = true; 
  #virtualisation.virtualbox.guest.x11 = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vm = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [

    ];
  };

  environment.systemPackages = with pkgs; [
    neovim 
    git
    tmux
    firefox
    lazygit
    htop
    kitty
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

}

