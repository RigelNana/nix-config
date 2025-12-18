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
    fuzzel
    waybar
    mako
    swww
    wl-clipboard
    neovim
    google-chrome
    grim
    slurp
    imv
    mpv
  ];
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/rigel/nix-config";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
  programs.git = {
    enable = true;
    userName = "RigelNana";
    userEmail = "809239189@qq.com";
  };

  
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  }; 
  home.stateVersion = "25.11";
} 
