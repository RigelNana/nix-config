{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./modules/home/programs/shell.nix
    ./modules/home/programs/terminal.nix
    ./modules/home/programs/editor.nix
    ./modules/home/programs/git.nix
    ./modules/home/programs/desktop.nix
    ./modules/home/services/ime.nix
    ./modules/home/services/wayland.nix
    ./modules/home/services/media.nix
    ./modules/home/themes/gtk.nix
    ./modules/home/themes/qt.nix
    ./modules/home/xdg/portal.nix
    ./modules/home/xdg/desktop-entries.nix
    ./modules/home/programs/obsidian.nix
  ];
  home.username = "rigel";
  home.homeDirectory = "/home/rigel";
  fonts.fontconfig.enable = true;
  home.stateVersion = "25.11";
}
