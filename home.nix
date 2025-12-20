{ config, lib, pkgs, ... }:
{
  home.username = "rigel";
  home.sessionVariables = {
    QT_IM_MODULES = "wayland;fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS="@im=fcitx";
   };
  #xdg.configFile."gtk-3.0/settings.ini".text = ''
  # [Settings]
  # gtk-im-module=fcitx
  #'';
  #xdg.configFile."gtk-4.0/settings.ini".text = ''
  # [Settings]
  # gtk-im-module=fcitx
  #'';
  #home.file.".gtkrc-2.0".text = ''
  # gtk-im-module=fcitx
  #'';
  xresources.properties = {
    "Xft.dpi" = 192;
  };

  home.homeDirectory = "/home/rigel";
  home.packages = with pkgs; [
    flatpak
    zip
    xz
    unzip
    p7zip
    ripgrep
    jq
    yq
    eza
    fzf
    bat
    fd
    waypaper
    sd
    file
    which
    tree
    nix-output-monitor
    nix-tree
    nix-index
    nix-inspect
    nix-init
    nurl
    swww
    wl-clipboard
    pavucontrol
    brightnessctl
    neovim
    google-chrome
    grim
    slurp
    imv
    mpv
    zed-editor
    swaybg
    libnotify
    xwayland-satellite
    ffmpeg
    yazi
    xh
    dust
    gping
    bottom
    qq
    localsend
    nautilus
    kdePackages.okular
  ];
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        color = {
          "1" = "light_blue";    # 标志性的浅蓝
          "2" = "light_magenta"; # 梦幻的浅粉
        };
        padding = {
          top = 2;
          right = 4;
        };
      };
      display = {
        separator = " ➜ ";
        # 全局亮色设置
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
        
        # --- 鲜艳色彩组 ---
        {
          type = "os";
          key = "󱄅 os";
          keyColor = "31"; # 鲜艳红 (ANSI 31)
        }
        {
          type = "kernel";
          key = "󰌽 kl";
          keyColor = "33"; # 鲜艳黄 (ANSI 33)
        }
        {
          type = "packages";
          key = "󰏖 pk";
          keyColor = "32"; # 鲜艳绿 (ANSI 32)
        }
        {
          type = "shell";
          key = " sh";
          keyColor = "36"; # 鲜艳青 (ANSI 36)
        }
        {
          type = "wm";
          key = " wm";
          keyColor = "34"; # 鲜艳蓝 (ANSI 34)
        }
        {
          type = "terminal";
          key = " tr";
          keyColor = "35"; # 鲜艳紫 (ANSI 35)
        }
        
        "break"
        
        # --- 硬件部分（高亮强调） ---
        {
          type = "cpu";
          key = " cpu";
          keyColor = "bright_red";
        }
        {
          type = "memory";
          key = " mem";
          keyColor = "bright_green";
        }
        
        "break"
        
        # --- 底部彩色条 ---
        {
          type = "colors";
          symbol = "block"; # 使用方块色块，色彩面积更大更鲜艳
        }
      ];
    };
  };
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Macchiato";
    font = {
      name = "Maple Mono NF CN";
      size = 14;
    };
    settings = {
      background_opacity = 0.9;
    };
  };
  programs.vscode = {
    enable = true;
  };
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/rigel/nix-config";
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
    };
  };
  programs.fuzzel.enable = true; 
  programs.swaylock.enable = true;
  programs.waybar.enable = true;
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 8000;
      border-radius = 8;
    };
  };
  services.polkit-gnome.enable = true;
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
  programs.git = {
    enable = true;
    settings.user = {
      name = "RigelNana";
      email = "809239189@qq.com";
    };
  };
  programs.ssh.enableDefaultConfig = false;
  programs.ssh.matchBlocks."*" = {
    forwardAgent = false;
    addKeysToAgent = "no";
    compression = false;
    serverAliveInterval = 0;
    serverAliveCountMax = 3;
    hashKnownHosts = false;
    userKnownHostsFile = "~/.ssh/known_hosts";
    controlMaster = "no";
    controlPath = "~/.ssh/master-%r@%n:%p";
    controlPersist = "no";
  };
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        addKeysToAgent = "yes";
        hostname = "github.com";
	user = "git";
	identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
  fonts.fontconfig.enable = true;
  xdg.configFile."electron-flags.conf".text = ''
    --enable-features=UseOzonePlatform
    --ozone-platform=wayland
    --enable-wayland-ime
    --wayland-text-input-version=3
  '';
  xdg.configFile."qq-flags.conf".text = ''
    --enable-features=UseOzonePlatform
    --ozone-platform-hint=auto
    --enable-wayland-ime
    --wayland-text-input-version=3
  '';
  #services.flatpak.remotes = lib.mkOptionDefault [{
  #  name = "sjtu";
  #  location = "https://mirror.sjtu.edu.cn/flathub";
  #}];
  #services.flatpak.packages = [
  #  "com.qq.QQ"
  #];

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };
    gtk2.extraConfig = "gtk-im-module = fcitx";
    gtk3.extraConfig = {
      gtk-im-module = "fcitx";
    };
    gtk4.extraConfig = {
      gtk-im-module = "fcitx";
    };
      
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [ "gtk" "gnome" ];
      };
      niri = {
        default = [ "gtk" "gnome" ];
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    xdgOpenUsePortal = true;
  };

  xdg.configFile."niri/config.kdl" = {
    source = ./config.kdl;
  };
  
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  }; 
  home.stateVersion = "25.11";
} 
