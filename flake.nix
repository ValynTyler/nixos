{
  description = "My custom NixOS flake";

  inputs = {
    # import nixpkgs flake
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # import home manager flake
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # import custom nixvim flake
    nixvim.url = "github:valyntyler/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    # spotify overlay
    spotx.url = "github:oskardotglobal/.dotfiles/nix";
    spotx.inputs.nixpkgs.follows = "nixpkgs";

    # zen brower
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # xremap flake
    xremap.url = "github:xremap/nix-flake";

    # wofi pickers
    wofirefox.url = "github:valyntyler/wofi-firefox";
    wofiemail.url = "github:valyntyler/wofi-thunderbird";
  };

  outputs = { self, nixpkgs, ... } @ inputs: {
    nixosConfigurations = {
      nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; host = "nixos-desktop"; };
        modules = [
          ./hosts/desktop
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";

            # import configuration
            home-manager.users."valyn" = import ./home;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
      nixos-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; host = "nixos-laptop"; };
        modules = [
          ./hosts/laptop
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";

            # import configuration
            home-manager.users."valyn" = import ./home;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}

