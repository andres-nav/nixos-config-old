{ nixpkgs, home-manager, dotfiles, hostname, ... }:
let
  system = "x86_64-linux";
  extraArgs = { 
    admin = "vm";
    inherit dotfiles;
  };

  config = {
    networking.hostName = hostname;
    nixpkgs.hostPlatform = nixpkgs.lib.mkDefault system;
  };

in {
  pkgs = nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };

  specialArgs = extraArgs;

  modules = [
    ./../config.nix
    ./config.nix 
    ./hardware.nix

    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = extraArgs;
      home-manager.users."${extraArgs.admin}" = {
        imports = [
	  ./../home.nix
	  ./home.nix
	];
      };
    }

    { inherit config; }
  ];
}
