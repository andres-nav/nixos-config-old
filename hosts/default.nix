{ nixpkgs, home-manager, ...}:
let
  host = import ./virtualbox { inherit nixpkgs home-manager; };

in {
  vm = nixpkgs.lib.nixosSystem {
    inherit (host) system modules;
  };
}
