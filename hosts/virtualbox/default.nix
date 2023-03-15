{ nixpkgs, home-manager, ... }:
let
  system = "x86_64-linux";

in {
  pkgs = nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };

  modules = [
    ./config.nix
    # home-manager.nixosModules.home-manager {
      # home-manager.useGlobalPkgs = true;
      # home-manager.useUserPackages = true;
      # home-manager.users.vm = import ./home.nix;
      # home-manager.verbose = true;
    # }
  ];
}
