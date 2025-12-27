{
  description = "Rigel flakes";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-flatpak.url = "https://flakehub.com/f/gmodena/nix-flatpak/0.6.0";
    chinese-fonts-overlay.url = "github:brsvh/chinese-fonts-overlay/main";
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
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      nix-index-database,
      nixos-hardware,
      nur,
      nix-flatpak,
      noctalia,
      nix-vscode-extensions,
      chinese-fonts-overlay,
      ...
    }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [ nur.overlays.default nix-vscode-extensions.overlays.default chinese-fonts-overlay.overlays.default];
          }
          nixos-hardware.nixosModules.lenovo-thinkpad-x1-13th-gen
          nix-index-database.nixosModules.default
          { programs.nix-index-database.comma = {
	      enable = true;
	    };
	  }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.rigel.imports = [
              ./home.nix
              nix-flatpak.homeManagerModules.nix-flatpak
              noctalia.homeModules.default
	      nix-index-database.homeModules.default
            ];
          }

        ];
      };
    };
}
