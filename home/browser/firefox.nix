{ pkgs, inputs, ... }:

let
  engines.unduck = {
    urls = [{
      template =  "https://unduck.link";
      params = [{ name = "q"; value = "{searchTerms}"; }];
    }];
    iconMapObj."16" = "https://unduck.link/search.svg";
    updateInterval = 24 * 60 * 60 * 1000; # every day
  };
  engines.nixpkg = {
    urls = [{
      template = "https://search.nixos.org/packages";
      params = [
        { name = "type"; value = "packages"; }
        { name = "query"; value = "{searchTerms}"; }
      ];
    }];
    iconMapObj."16" = "https://search.nixos.org/favicon.png";
    definedAliases = [ "@np" ];
  };
in 
{
  # browser
  programs.firefox = {
    enable = true;
    profiles."self" = {
      id = 0;
      isDefault = false;
      search = {
        default = "Unduck";
        force = true;
        order = [ "Unduck" "Nix Packages" ];
        engines = {
          # custom search engines
          "Unduck" = engines.unduck;
          "Nix Packages" = engines.nixpkg;

          # disable defaults
          "Bing".metaData.hidden = true;
          "Google".metaData.hidden = true;
          "DuckDuckGo".metaData.hidden = true;
          "Wikipedia (en)".metaData.hidden = true;
        };
      };
    };
    profiles."work" = {
      id = 1;
      isDefault = true;
      search = {
        default = "Unduck";
        force = true;
        order = [ "Unduck" "Nix Packages" ];
        engines = {
          # custom search engines
          "Unduck" = engines.unduck;
          "Nix Packages" = engines.nixpkg;

          # disable defaults
          "Bing".metaData.hidden = true;
          "Google".metaData.hidden = true;
          "DuckDuckGo".metaData.hidden = true;
          "Wikipedia (en)".metaData.hidden = true;
        };
      };
    };
  };
}
