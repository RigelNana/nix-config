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
    zoxide
    bat
    fd
    sd
    file
    which
    tree
    nix-output-monitor
    nix-tree
    nix-index
    kitty
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
  ];
  programs.vscode = {
    enable = true;
  };
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/rigel/nix-config";
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
  };
  programs.git = {
    enable = true;
    settings.user = {
      name = "RigelNana";
      email = "809239189@qq.com";
    };
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
	user = "git";
	identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
  
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  }; 
  home.stateVersion = "25.11";
} 
