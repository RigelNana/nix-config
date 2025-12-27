{ config, pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-rime
      rime-data
      kdePackages.fcitx5-configtool
      kdePackages.fcitx5-qt
      qt6Packages.fcitx5-chinese-addons
      libsForQt5.fcitx5-qt
    ];
  };
}