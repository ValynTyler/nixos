# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common/core
    ../common/optional/spotify.nix
    ../common/optional/steam.nix
    ../common/optional/discord.nix
    ../common/optional/syncthing.nix
    ../common/optional/kanata.nix
    ../common/optional/atuin.nix
    ../common/optional/virtualbox.nix
  ];

  # Enable flakes and nix command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.valyn = {
    isNormalUser = true;
    description = "Valyn";
    extraGroups = [ "networkmanager" "wheel" "uinput" "uupc" "dialout" ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.dconf.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [ git ];

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
