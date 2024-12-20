{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common/core
    ../common/optional/steam.nix
    ../common/optional/spotify.nix
    ../common/optional/syncthing.nix
    ../common/optional/kanata.nix
  ];

  # Enable flakes and nix command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.valyn = {
    isNormalUser = true;
    description = "Valyn";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.dconf.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [ vim git ];

  # Set the default editor to nvim
  environment.variables.EDITOR = "nvim";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  system.stateVersion = "24.05";

}
