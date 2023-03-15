{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot = {
    initrd = {
      availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
      kernelModules = [ "dm-snapshot" ];
    };
    kernelModules = [ ];
    extraModulePackages = [ ];

    initrd.luks.devices."nixenc".device = "/dev/disk/by-partlabel/primary";

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/" = { 
      device = "/dev/mapper/vg-root";
      fsType = "btrfs";
      options = [ "subvol=root" "compress-force=zstd" "noatime" ];
    };

    "/home" = { 
      device = "/dev/mapper/vg-root";
      fsType = "btrfs";
      options = [ "subvol=home" "compress-force=zstd" "noatime" ];
    };

    "/nix" = {
      device = "/dev/mapper/vg-root";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress-force=zstd" "noatime" ];
    };

    "/persist" = {
      device = "/dev/mapper/vg-root";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress-force=zstd" "noatime" ];
    };

    "/var/log" = {
      device = "/dev/mapper/vg-root";
      fsType = "btrfs";
      options = [ "subvol=log" "compress-force=zstd" "noatime" ];
    };

    "/boot" = { 
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };
  };

  swapDevices = [ { device = "/dev/mapper/vg-swap"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;
nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux"; hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware; virtualisation.virtualbox.guest.enable = true; }
