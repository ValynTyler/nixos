{ pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # disable unneeded gnome packages
  environment.gnome.excludePackages = with pkgs; [
    simple-scan
    yelp
    gnome-music
    gnome-tour
    epiphany
    seahorse
    evince
    geary
    gnome-keyring
  ];

  environment.systemPackages = with pkgs; [
    # gnome tweaks
    gnome-tweaks

    # gnome extensions
    gnomeExtensions.user-themes
    gnomeExtensions.pop-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.xremap
  ];
}
