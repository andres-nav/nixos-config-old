{ config, lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Andres Navarro";
    userEmail = "contact@andresnav.com";
  };
}
