{
  programs.lazygit.enable = true;
  programs.lazygit.settings.gui = {
    # scrolloff
    scrollPastBottom = true;
    scrollOffMargin = 999;
    scrollOffBehaviour = "margin";

    # spinner
    spinner.rate = 60;
    spinner.frames = [ # (find more at https://www.npmjs.com/package/cli-spinners)
      "←"
      "↖"
      "↑"
      "↗"
      "→"
      "↘"
      "↓"
      "↙"
    ];
  };

  # shell integrations
  programs.bash.initExtra = ''
    lg() {
      export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

      lazygit "$@"

      if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
        rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
      fi
    }
  '';

  programs.zsh.initExtra = ''
    lg() {
      export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

      lazygit "$@"

      if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
        rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
      fi
    }
  '';

  programs.fish.shellInit = ''
    function lg
      set -x LAZYGIT_NEW_DIR_FILE ~/.lazygit/newdir

      lazygit $argv

      if test -f $LAZYGIT_NEW_DIR_FILE
          cd (cat $LAZYGIT_NEW_DIR_FILE)
          rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
      end
    end
  '';

  programs.nushell.extraConfig = ''
    def --env lg [...args] {
      let lazygit_new_dir_file = $"($env.HOME)/.lazygit/newdir"
      $env.LAZYGIT_NEW_DIR_FILE = $lazygit_new_dir_file
      lazygit ...$args

      if ($lazygit_new_dir_file | path exists) {
        cd (open $lazygit_new_dir_file | str trim)
        rm -f $lazygit_new_dir_file
      }
    }
  '';
}
