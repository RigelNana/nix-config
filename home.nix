{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.username = "rigel";
  home.sessionVariables = {
    QT_IM_MODULES = "wayland;fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };
  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.nautilus}/bin/nautilus";
      };
    };
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
  xdg.desktopEntries."wpsoffice-cn" = {
    name = "WPS";
    exec = "env QT_FONT_DPI=192 wps %F";
  };
  services.swww.enable = true;
  programs.noctalia-shell = {
    enable = true;
  };
  programs.neovide = {
    enable = true;
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
    nixd
    nix-output-monitor
    nix-tree
    nix-inspect
    nix-init
    playerctl
    nurl
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
    wpsoffice-cn
    telegram-desktop
    obs-studio
    qalculate-qt
    cherry-studio
    nixfmt
    prismlauncher
    nvd
    lazygit
    zellij
    duf
    
    (pkgs.wechat.overrideAttrs (oldAttrs: {
  src = pkgs.fetchurl {
    url = "https://dldir1.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage";
    sha256 = "0v6k7bghgsvjnv2bbfvzqc7256gwa0hri9bdva35269lxrp49gps";
  };
}))
  ];
  programs.emacs = {
    enable = true;
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.obsidian = {
    enable = true;
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
          key = " sh";
          keyColor = "36";
        }
        {
          type = "wm";
          key = " wm";
          keyColor = "34";
	} 
	{
          type = "terminal";
          key = " tr";
          keyColor = "35";
        }

        "break"

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

        {
          type = "colors";
          symbol = "block";
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
      hide_window_decorations = true;
      window_padding_width = 5;
      enable_audio_bell = false;
    };
  };
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.nix-vscode-extensions.vscode-marketplace-release; [
        github.copilot
	github.copilot-chat
	ms-ceintl.vscode-language-pack-zh-hans
	catppuccin.catppuccin-vsc
	catppuccin.catppuccin-vsc-icons
	ms-python.python
	llvm-vs-code-extensions.vscode-clangd
	ms-azuretools.vscode-containers
	fill-labs.dependi
	ms-vscode-remote.remote-containers
	ms-azuretools.vscode-docker
	usernamehw.errorlens
	tamasfe.even-better-toml
	mhutchie.git-graph
	donjayamanne.githistory
	github.vscode-github-actions
	golang.go
	ms-kubernetes-tools.vscode-kubernetes-tools
	yzhang.markdown-all-in-one
	shd101wyy.markdown-preview-enhanced
	bierner.markdown-mermaid
	unifiedjs.vscode-mdx
	oxc.oxc-vscode
	yoavbls.pretty-ts-errors
	ms-python.vscode-pylance
	ms-python.debugpy
	ms-vscode-remote.remote-ssh
	ms-vscode-remote.remote-ssh-edit
	ms-vscode.remote-server
	ms-vscode.remote-explorer
	charliermarsh.ruff
	rust-lang.rust-analyzer
	svelte.svelte-vscode
	myriad-dreamin.tinymist
	redhat.vscode-yaml
	jnoortheen.nix-ide
        mkhl.direnv
      ];
    };
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
  #programs.waybar = {
  #  enable = true;
  #  systemd.enable = true;
  #};
  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;
  #services.mako = {
  #  enable = true;
  #  settings = {
  #    default-timeout = 8000;
  #    border-radius = 8;
  #  };
  #};
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
  services.flatpak.packages = [
  ];

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
  };

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "gtk"
          "gnome"
        ];
      };
      niri = {
        default = [
          "gtk"
          "gnome"
        ];
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
  programs.nix-index = {
    enable = true;
    enableZshIntegration = false;
  };
  home.stateVersion = "25.11";
}
