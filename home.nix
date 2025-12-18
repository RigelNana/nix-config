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
    nh
    nix-output-monitor
    nix-tree
    nix-index
    kitty
    fuzzel
    waybar
    mako
    swww
    wl-clipboard
  ];
  
  home.sessionVariables = {
    NH_FLAKE = "/etc/nixos";
  };
  home.stateVersion = "25.11";
} 
