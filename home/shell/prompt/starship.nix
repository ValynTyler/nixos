{
  programs.starship.enable = true;
  programs.starship.settings = {
    # disable newline before prompt
    add_newline = false;
  
    # disable modules
    line_break.disabled = true;
    package.disabled = true;

    # character
    character.success_symbol = "[❯](bold bright-green)";
    character.error_symbol = "[✗](bold bright-red)";

    # folder
    directory.truncate_to_repo = false;
    directory.format = "[$path]($style)[$read_only]($read_only_style) ";

    # git
    git_status.style = "bold bright-red";

    # languages
    rust = {
      format = "via [$symbol]($style)";
      symbol = "󱘗 ";
      style = "bold bright-red";
    };

    lua = {
      format = "via [$symbol]($style)";
      symbol = " ";
    };

    golang = {
      format = "via [$symbol]($style)";
      symbol = " ";
      style = "bold bright-blue";
    }; 
  };
}