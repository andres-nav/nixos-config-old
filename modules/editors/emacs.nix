{ config, lib, pkgs, ... }:
{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: [
      epkgs.magit
      epkgs.vterm

    ];
  };

  home.packages = with pkgs; [
    libvterm
  ];

  services.emacs = {
    enable = true;
    defaultEditor = true;
  };
}
