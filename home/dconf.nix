{
  # configure dconf
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
    "org/gnome/desktop/interface" = {
      clock-show-seconds = false;
      clock-show-weekday = false;
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/wm/keybindings" = {
      show-desktop=["<Super>d"];
      switch-applications= [];
      switch-applications-backward= [];
      switch-windows=["<Alt>Tab"];
      switch-windows-backward=["<Shift><Alt>Tab"];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      # open `~/` in nautilus
      home=["<Super>e"];
      # tell dconf where to look for custom keybindings
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "launch terminal";
      command = "wezterm";
      binding = "<Super>Q";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "launch work browser";
      command = "firefox -p work";
      binding = "<Super>W";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "launch personal browser";
      command = "firefox -p self";
      binding = "<Super>B";
    };
  };
}
