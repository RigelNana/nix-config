{
  description = "Rigel flakes";
  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
      
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      nix-index-database.url = "github:nix-community/nix-index-database";
      nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
      
  };
  outputs = {self, nixpkgs, nixpkgs-stable, home-manager, nix-index-database, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        nix-index-database.nixosModules.default
        { programs.nix-index-database.comma.enable = true; }
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.rigel = import ./home.nix;
        }
      ];
    };
  };
}
