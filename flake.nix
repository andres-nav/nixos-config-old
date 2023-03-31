{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-22.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: 
  let
    dotfiles = config.lib.file.mkOutOfStoreSymlink "/test/dotfiles";

    commonInherits = {
      inherit nixpkgs home-manager dotfiles;
    };


  in {
    nixosConfigurations = import ./hosts (commonInherits);
  };
}
