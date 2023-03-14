{ nixpkgs, home-manager, ...}:
let
  host = import ./virtualbox { inherit nixpkgs home-manager; };

in {
  vm = nixpkgs.lib.nixosSystem {
    system = host.system;
    modules = host.modules;
  };
}
