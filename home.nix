{ config, pkgs, ... }:
{
  home.username = "rigel";
  home.homeDirectory = "/home/rigel";
  home.packages = with pkgs; [
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
    nix-output-monitor
    nix-tree
    nix-index
    nix-inspect
    nix-init
    nurl
    swww
    wl-clipboard
    neovim
    google-chrome
    grim
    slurp
    imv
    mpv
    zed-editor
    swaybg
    xwayland-satellite
    ffmpeg
    yazi
    qq
    xh
    dust
    gping
    bottom
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
    font = {
      name = "Maple Mono NF CN";
      size = 14;
    };
    settings = {
      background_opacity = "0.9";
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
  services.mako.enable = true;
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

  home.file.".config/niri/config.kdl" = {
    source = ./config.kdl;
  };
  
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  }; 
  home.stateVersion = "25.11";
} 
