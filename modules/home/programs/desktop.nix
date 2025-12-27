{ config, pkgs, ... }:
{
  programs.noctalia-shell.enable = true;
  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/rigel/nix-config";
  };

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
    libplist
    waypaper
    sd
    file
    which
    tree
    nixd
    hyprpicker
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
    jetbrains.idea
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
    jetbrains.rider
    wechat
  ];
}