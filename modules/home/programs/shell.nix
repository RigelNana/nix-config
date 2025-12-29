{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "eza --icons";
      ll = "eza -lh --icons --grid";
    };
  };
  programs.zsh.dotDir = config.home.homeDirectory;
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
    };
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        color = {
          "1" = "light_blue";
          "2" = "light_magenta";
        };
        padding = {
          top = 2;
          right = 4;
        };
      };
      display = {
        separator = " ➜ ";
        color = {
          keys = "magenta";
        };
      };
      modules = [
        {
          type = "title";
          color = {
            user = "light_blue";
            at = "white";
            host = "light_magenta";
          };
        }
        "break"
        {
          type = "os";
          key = "󱄅 os";
          keyColor = "31";
        }
        {
          type = "kernel";
          key = "󰌽 kl";
          keyColor = "33";
        }
        {
          type = "packages";
          key = "󰏖 pk";
          keyColor = "32";
        }
        {
          type = "shell";
          key = " sh";
          keyColor = "36";
        }
        {
          type = "wm";
          key = " wm";
          keyColor = "34";
        }
        {
          type = "terminal";
          key = " tr";
          keyColor = "35";
        }
        "break"
        {
          type = "cpu";
          key = " cpu";
          keyColor = "bright_red";
        }
        {
          type = "memory";
          key = " mem";
          keyColor = "bright_green";
        }
        "break"
        {
          type = "colors";
          symbol = "block";
        }
      ];
    };
  };
}