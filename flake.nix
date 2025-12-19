{
  description = "Rigel flakes";
  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
      nixos-hardware.url = "github:NixOS/nixos-hardware/master";
      
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      nur = {
        url = "github:nix-community/NUR";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      nix-index-database.url = "github:nix-community/nix-index-database";
      nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
      
  };
  outputs = {self, nixpkgs, nixpkgs-stable, home-manager, nix-index-database, nixos-hardware, nur, ... }@inputs:{
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
	{
	  nixpkgs.config.allowUnfree = true;
	  nixpkgs.overlays = [ nur.overlays.default ];
        }
	nixos-hardware.nixosModules.lenovo-thinkpad-x1-13th-gen
        nix-index-database.nixosModules.default
        { programs.nix-index-database.comma.enable = true; }
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.rigel = import ./home.nix;
	  home-manager.extraSpecialArgs = { inherit inputs; };
        }

      ];
    };
  };
}
