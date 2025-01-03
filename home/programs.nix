{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # screensavers
    cbonsai
    cmatrix
    neofetch
    pipes
    sl

    # tools
    bat
    glow

    # utils
    ripgrep
    usbutils
    pciutils
    zip
    unzip
    mkvtoolnix-cli
    nmap
    imagemagick
    jellyfin-ffmpeg
    helvum
    networkmanagerapplet
    blueman

    # drivers
    pwvucontrol
    brightnessctl
    playerctl

    # notifications
    mako

    # clipboard providers
    wl-clipboard

    # text
    obsidian

    # art
    gimp
    inkscape

    # music
    vmpk
    musescore
    reaper

    # 3D
    freecad

    # misc.
    qbittorrent
  ];
}
