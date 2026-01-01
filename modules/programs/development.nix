{ config, pkgs, ... }:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    icu
    fuse3
    curl
    glib
    openssl
    libplist
    gtk3
    libusbmuxd
    libimobiledevice
  ];

  services.flatpak.enable = true;
  services.v2raya.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    btop
    curl
    tmux
    htop
    fastfetch
    pciutils
    usbutils
    file
    unzip
    zip
    tree
    ripgrep
    sof-firmware
    alsa-ucm-conf
  ];
}
