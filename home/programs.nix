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
    ripgrep
    btop
    usbutils
    zip
    unzip
    wl-clipboard
    mkvtoolnix-cli
    nmap

    # text
    obsidian

    # art
    gimp
    inkscape

    # video
    davinci-resolve

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
