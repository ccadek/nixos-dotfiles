{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };


  outputs = { self, nixpkgs, home-manager,... }@inputs: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
    };
    nixosConfigurations.noice = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
      <home-manager/nixos>
        ./configuration.nix
      ];
    };
  };
}
