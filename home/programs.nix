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
    fzf
    glow

    # utils
    btop
    usbutils
    zip
    unzip
    wl-clipboard
    mkvtoolnix-cli

    # text
    obsidian

    # art
    gimp
    inkscape

    # music
    musescore

    # misc.
    qbittorrent
  ];
}
