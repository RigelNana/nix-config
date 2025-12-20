{ config, lib, pkgs, ... }:
{
  home.username = "rigel";
  home.sessionVariables = {
    QT_IM_MODULES = "wayland;fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS="@im=fcitx";
   };
  xdg.configFile."gtk-3.0/settings.ini".text = ''
   [Settings]
   gtk-im-module=fcitx
  '';
  xdg.configFile."gtk-4.0/settings.ini".text = ''
   [Settings]
   gtk-im-module=fcitx
  '';
  home.file.".gtkrc-2.0".text = ''
   gtk-im-module=fcitx
  '';
  xresources.properties = {
    "Xft.dpi" = 192;
  };

  home.homeDirectory = "/home/rigel";
  home.packages = with pkgs; [
    flatpak
    fastfetch
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
    sd
    file
    which
    tree
    localsend
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
  ];
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
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
