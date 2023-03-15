{ config, lib, pkgs, inputs, user, ... }:
{
  imports =
    [ 
      ./hardware.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "test";

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkDefault "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      layout = "us";
      xkbOptions = "caps:swapescape,ctrl:swap_lalt_lctl";
    };
  };

  virtualisation.virtualbox.guest.x11 = true;


  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.test = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      htop
    ];
  };

  environment.systemPackages = with pkgs; [
    neovim 
    git
    tmux
    lazygit
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

  # DO NOT TOUCH THIS
  system.stateVersion = "22.11";

}

