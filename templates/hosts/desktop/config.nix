{ config, lib, pkgs, inputs, user, ... }:
{
  time.timeZone = "Europe/Madrid";

  services = {
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      layout = "us";
      xkbOptions = "caps:swapescape,ctrl:swap_lalt_lctl";
    };
  };

  users.users.me = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [

    ];
  };

  environment.systemPackages = with pkgs; [
    neovim 
    git
    tmux
    lazygit
    htop
    kitty
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

}

